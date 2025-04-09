{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
        cycle = false;
        plugins = (with pkgs;[
            rofi-calc
        ]);
        extraConfig = {
            modi = "drun,filebrowser,calc";
        };
        theme = ./custom_theme.rasi;
    };

    home.packages = (with pkgs; [
        rofi-emoji-wayland
    ]);
}