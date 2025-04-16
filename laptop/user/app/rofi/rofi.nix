{ pkgs, pkgs-unstable, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs-unstable.rofi;
        cycle = false;
        plugins = (with pkgs-unstable;[
            rofi-calc
            rofi-emoji-wayland
        ]);
        # theme = ./custom_theme.rasi;
        extraConfig = {
            modi = "drun,filebrowser,calc,emoji";
        };
    };
}