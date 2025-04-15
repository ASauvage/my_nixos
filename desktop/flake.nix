{
    description = "NixOS system installation for desktop";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        hyprpanel = {
            url = "github:jas-singhfsu/hyprpanel";
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
            system = "x86_64-linux";
            hostname = "nixos";
            timezone = "Europe/Paris";
            defaultLocale = "en_US.UTF-8";
            locale = "fr_FR.UTF-8";
            authorizedKeys = [];
        };

        # ----- USER SETTINGS ----- #
        userSettings = {
            username = "alex";
            name = "Alex";
            email = "a.sauvagepotel@gmail.com";
            dotfilesDir = "/home/alex/.dotfiles";
            browser = "firefox";
            term = "foot";
            editor = "vim";
            weatherApiKey = "";
        };

        pkgs = import inputs.nixpkgs {
            system = systemSettings.system;
            overlays = [
                inputs.hyprpanel.overlay
            ];
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
        pkgs-unstable = import inputs.nixpkgs-unstable {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
    in {
        nixosConfigurations = {
            system = inputs.nixpkgs.lib.nixosSystem {
                system = systemSettings.system;
                specialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
                    inherit systemSettings;
                    inherit userSettings;
                };
                modules = [
                    ./system/configuration.nix
                ];
            };
        };

        homeConfigurations = {
            user = inputs.home-manager.lib.homeManagerConfiguration {
                inherit pkgs;

                extraSpecialArgs = {
                    inherit inputs;
                    inherit pkgs-unstable;
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