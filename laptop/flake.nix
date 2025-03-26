{
    description = "NixOS system installation for laptop";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        agspkgs = {
            url = "github:aylur/astal";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, ... } @ inputs: let
        # ---- SYSTEM SETTINGS ---- #
        systemSettings = {
            system = "x86_64-linux";        # system arch
            hostname = "nixos";             # hostname
            profile = "personal";           # select a profile defined from my profiles directory
            timezone = "Europe/Paris";      # select timezone
            locale = "en_US.UTF-8";         # select locale
            bootMode = "uefi";              # uefi or bios
            bootMountPath = "/boot";        # mount path for efi boot partition; only used for uefi boot mode
        };

        # ----- USER SETTINGS ----- #
        userSettings = {
            username = "alex";                  # username
            name = "Alex";                      # name/identifier
            email = "alex@mail.com";            # email (used for certain configurations)
            dotfilesDir = "~/.dotfiles";        # absolute path of the local repo
            wmType = "wayland";
            browser = "firefox";                # Default browser; must select one from ./user/app/browser/
            term = "foot";                      # Default terminal command;
            editor = "vim";                     # Default editor;
        };

        pkgs = import inputs.nixpkgs {
            inherit systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
        pkgs-unstable = import inputs.nixpkgs-unstable {
            inherit systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
        pkgsags = import inputs.agspkgs {
            inherit systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
    in {
        nixosConfigurations = {
            system = nixpkgs.lib.nixosSystem {
                inherit systemSettings.system;
                specialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
                    inherit pkgsags;
                    inherit systemSettings;
                    inherit userSettings;
                };
                modules = [
                    ./systems/configuration.nix
                ];
            };
        };

        homeConfigurations = {
            user = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
                    inherit pkgsags;
                    inherit systemSettings;
                    inherit userSettings;
                };
                modules = [
                    ./user/home.nix
                ];
            };
        };
    };
}