#!/bin/sh

TEMP_DIR=$(mktemp -d)
REPO_URL="https://github.com/ASauvage/my_nixos.git"

echo "Cloning repository..."
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" || exit 1

echo "Copying files to /etc/nixos..."
sudo cp "/etc/nixos/hardware-configuration.nix" "$TEMP_DIR"/nix
sudo rm -rf "/etc/nixos/"
sudo mkdir "/etc/nixos"
sudo cp -rf "$TEMP_DIR"/nix/* /etc/nixos/ || {
    echo "Error: Failed to copy files"
    rm -rf "$TEMP_DIR"
    exit 1
}
sudo cp -rf "$TEMP_DIR"/dotfiles/ /etc/nixos/dotfiles || {
    echo "Error: Failed to copy files"
    rm -rf "$TEMP_DIR"
    exit 1
}

echo "Cleaning up..."
rm -rf "$TEMP_DIR"
rm -rf "/etc/nixos/dotfiles/"

echo "Configuration added successfully!"

read -p "Do you wish to rebuild nixos? [Yn]: " yn
if [[ $yn =~ ^[Yy]$ ]]; then
    sudo nixos-rebuild switch
fi