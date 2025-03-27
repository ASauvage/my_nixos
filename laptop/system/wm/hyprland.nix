{ inputs, pkgs, lib, ... }:

{
    imports = [
        ./wayland.nix
        ./pipewire.nix
    ];

    security = {
        pam.services.login.enableGnomeKeyring = true;
    };

    services.gnome.gnome-keyring.enable = true;

    programs = {
        hyprland = {
            enable = true;
            package = pkgs.hyprland;
            xwayland = {
                enable = true;
            };
        };
    };

    services.xserver.excludePackages = [ pkgs.xterm ];

    services.xserver = {
        displayManager.sddm = {
            enable = true;
            package = pkgs.sddm;
            wayland.enable = true;
            theme = "where_is_my_sddm_theme_qt5";
        };
    };
}