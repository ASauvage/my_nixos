{ inputs, pkgs, pkgs-unstable, pkgsags, systemSettings, ... }:

{

    imports = [
        ./hardware-configuration.nix
    ];

    nix = let
        flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
        settings = {
            experimental-features = "nix-command flakes";
            flake-registry = "";
            nix-path = config.nix.nixPath;
        };
        channel.enable = false;

        # Opinionated: make flake registry and nix path match flake inputs
        registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
        nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

    networking.hostName = "nixos";

    users.users = {
        alex = {
            initialPassword = "1234";  # Be sure to change it (using passwd) after rebooting!
            isNormalUser = true;
            openssh.authorizedKeys.keys = [
                # TODO: Add your SSH public key(s) here
            ];
            extraGroups = ["networkmanager" "wheel" "docker"];
        };
    };

    services.openssh = {
        enable = true;
        settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        };
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.11";
}