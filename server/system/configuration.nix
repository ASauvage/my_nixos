{ pkgs, lib, systemSettings, userSettings, ... }:

{

    imports = [
        ../../hardware-configuration.nix
    ];

    nix.settings = {
        experimental-features = ["nix-command" "flakes"];
        trusted-users = [ "@wheel" ];
    };

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 15d";
    };

    nixpkgs.config.allowUnfree = true;

    boot.loader = {
        systemd-boot.enable = true;
        efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
        };
    };

    networking.hostName = systemSettings.hostname;
    networking.networkmanager.enable = true;

    time.timeZone = systemSettings.timezone;
    i18n.defaultLocale = systemSettings.defaultLocale;
    i18n.extraLocaleSettings = {
        LC_ADDRESS = systemSettings.locale;
        LC_IDENTIFICATION = systemSettings.locale;
        LC_MEASUREMENT = systemSettings.locale;
        LC_MONETARY = systemSettings.locale;
        LC_NAME = systemSettings.locale;
        LC_NUMERIC = systemSettings.locale;
        LC_PAPER = systemSettings.locale;
        LC_TELEPHONE = systemSettings.locale;
        LC_TIME = systemSettings.locale;
    };

    users.users.${userSettings.username} = {
        isNormalUser = true;
        description = userSettings.name;
        extraGroups = [ "networkmanager" "wheel" ];
        packages = [];
        uid = 1000;
    };

    # System packages
    environment.systemPackages = with pkgs; [
        vim
        wget
        fish
        git
        home-manager
        direnv
    ];

    environment.shells = with pkgs; [ ${userSettings.defaultShell} ];
    users.defaultUserShell = pkgs.${userSettings.defaultShell};
    programs.${userSettings.defaultShell}.enable = true;

    fonts.fontDir.enable = true;

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    system.stateVersion = "24.11";
}