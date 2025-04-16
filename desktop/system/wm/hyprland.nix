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
            withUWSM = true;
            xwayland = {
                enable = true;
            };
        };
    };

    services.displayManager.sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
        extraPackages = [
            pkgs.kdePackages.qt5compat
        ];
        wayland.enable = true;
        theme = "where_is_my_sddm_theme";
    };
}
