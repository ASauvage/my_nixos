# My NixOS flake configurations

This repository contains my NixOS flake configuration for setting up my laptop and server.


# Install the OS

- Install NixOS trough the standard process
  - Create an user and a password.
  - Do not enable any desktop env (if for server, otherwise do as you please)
  - Install
- Restart and login to your user

# Install the config
## with script

Execute the following command to pull and use the install.sh script from this repository :
```sh
curl -sSL https://raw.githubusercontent.com/ASauvage/my_nixos/main/install.sh | nix-shell -p git --run "sh -s -- --profile laptop"
```
Change "laptop" by "server" to select the configuration to be used.

This script will install th flake at `~/.dotfiles` custom commnd to rebuild will be create such as:
- ```sh
  rebuild --home      # will perform a home-manager switch
  ```

- ```sh
  rebuild --system    # will perform a nixos-rebuild switch
  ```

- ```sh
  rebuild --all       # will perform a nixos-rebuild switch and home-manager switch
  ```

**The script will edit the configurations accordingly to your setup**

## manually

Clone the repository in a safe location (`~./dotfiles` for example) and run the following command:

```sh
cd ~/.dotfiles  # Change location according to your location

# generate hardware-configuration
sudo nixos-generate-config --show-hardware-config > ./hardware-configuration.nix

# rebuild NixOS
sudo nixos-rebuild switch --flake ~/.dotfiles/laptop#system;  # Feel free to change `laptop` by server

# rebuild home
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.dotfiles/laptop#user;
```

**Don't forget to customise the `flake.nix` inside your configuration profile**