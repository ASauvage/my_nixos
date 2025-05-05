# My NixOS Flake Configurations

This repository contains my NixOS flake configuration for setting up my laptop, desktop and server.

## About This Configuration

There are 3 profiles available in this repository:

- `laptop`: NixOS system for laptop users (includes battery support and other laptop-related features)
- `desktop`: (wip) NixOS system for desktop users (similar to the laptop profile but without battery support and with different monitor configuration)
- `server`: (wip) NixOS system for servers (lightweight system without a desktop environment)

### Channels Used

- [NixOS 24.11 Stable](https://github.com/nixos/nixpkgs/tree/nixos-24.11)
- [NixOS Unstable](https://github.com/nixos/nixpkgs/tree/nixos-unstable)
- [Hyprpanel](https://github.com/jas-singhfsu/hyprpanel)
- [Home Manager 24.11](https://github.com/nix-community/home-manager/tree/release-24.11)

### Last Flake Update

| Laptop     | Desktop    | Server     |
| :--------: | :--------: | :--------: |
| 2025-05-05 | 2025-04-15 | Never      |

## Install the OS

- Install NixOS through the standard process:
  - Create a user and a password.
  - Do not enable any desktop environment (if for a server; otherwise, configure as desired).
  - Complete the installation.
- Restart and log in to your user account.

## Install the Configuration

### Using the Script

Execute the following command to pull and use the `install.sh` script from this repository:

```sh
curl -sSL https://raw.githubusercontent.com/ASauvage/my_nixos/main/install.sh | nix-shell -p git --run "sh -s -- --profile laptop"
```

Replace `laptop` with `server` to select the appropriate configuration.

This script will install the flake at `~/.dotfiles`. A custom command will be created for rebuilding:

- ```sh
  rebuild --home      # Performs a home-manager switch
  ```

- ```sh
  rebuild --system    # Performs a nixos-rebuild switch
  ```

- ```sh
  rebuild --all       # Performs both a nixos-rebuild switch and a home-manager switch
  ```

**The script will adjust configurations according to your setup.**

### Manual Installation

Clone the repository to a safe location (e.g., `~/.dotfiles`) and run the following commands:

```sh
cd ~/.dotfiles  # Adjust the path as needed

# Generate hardware-configuration
sudo nixos-generate-config --show-hardware-config > ./hardware-configuration.nix

# If you want to update lockfile, replace `laptop` with `server` if needed
nix flake update --flake ~/.dotfiles/laptop

# Rebuild NixOS
sudo nixos-rebuild switch --flake ~/.dotfiles/laptop#system 

# Rebuild home environment
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles/laptop#user
```

**Don't forget to customize the `flake.nix` inside your configuration profile.**
