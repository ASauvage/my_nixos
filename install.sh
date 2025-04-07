#!/bin/sh

profile=""
location=""

function show_help() {
    echo "Usage: $0 [options]"
    echo ""
    echo "Options:"
    echo "  -h, --help       Display this help message"
    echo "  -p, --profile    Choose the profile"
    echo "  -l, --location   Choose the location (default: '~/.dotfiles')"
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            show_help
            exit 0
            ;;
        -p|--profile)
            profile="$2"
            shift 2
            ;;
        -l|--location)
            location="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
        ;;
    esac
done

# Output chosen profile and location if available
if [ -n "$profile" ]; then
    echo "Profile chosen: $profile"
else
    echo "No profile chosen"
    exit 1
fi

if [ -n "$location" ]; then
    echo "Location chosen: $location"
else
    location=$(eval echo ~$USER)"/.dotfiles"
    echo "No location chosen, location use: '$location'"
fi

# Clone dotfiles
echo "Cloning dotfiles..."
nix-shell -p git --command "git clone https://github.com/ASauvage/my_nixos.git $location"

# Generate hardware config for new system
echo "Generate hardware config..."
sudo nixos-generate-config --show-hardware-config > $location/hardware-configuration.nix

# Patch flake.nix with different username/name and remove email by default
sed -i "0,/alex/s//$(whoami)/" $location/$profile/flake.nix
sed -i "0,/Alex/s//$(getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ',' -f 1)/" $location/$profile/flake.nix
sed -i "s/emmet@librephoenix.com//" $location/$profile/flake.nix
sed -i "s+~/.dotfiles+$location+g" $location/$profile/flake.nix

answer=""

while [[ ! "$answer" =~ ^[Yy]$ ]]; do
    echo -e "Rebuild system with this parameters:\n# ---- SYSTEM SETTINGS ---- #"
    awk '/systemSettings = {/,/};/ {if ($0 !~ /systemSettings = \{/) print}' $location/$profile/flake.nix | sed '/^ *\}/d' | sed 's/^[ \t]*//'
    echo -e "\n# ----- USER SETTINGS ----- #"
    awk '/userSettings = {/,/};/ {if ($0 !~ /userSettings = \{/) print}' $location/$profile/flake.nix | sed '/^ *\}/d' | sed 's/^[ \t]*//'

    read -p "Do you want to proceed? (y/n): " answer < /dev/tty

    if [[ "$answer" =~ ^(n|N)$ ]]; then
        # Open up editor to manually edit flake.nix before install
        if [ -z "$EDITOR" ]; then
            EDITOR=nano;
        fi
        $EDITOR $location/$profile/flake.nix;
    else
        echo "invalid response!"
    fi
done

# Update flake
read -p "Do you want to update flake lockfile? (y/n): " answer
if [[ "$answer" =~ ^(y|Y)$ ]]; then
    echo "Updating lockfile..."
    nix flake update --flake $location/$profile
else
    echo "Skip lockfile update"
fi

# Rebuild system
echo "Rebuild system..."
sudo nixos-rebuild switch --flake $location/$profile/#system;

# Install and build home-manager configuration
echo "Build home-manager..."
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake $location/$profile/#user;

echo "All set! Now, just one final step: log out!"
