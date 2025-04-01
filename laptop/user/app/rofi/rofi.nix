{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
        cycle = false;
        plugins = (with pkgs;[
            rofi-calc
            rofimoji
        ]);
        extraConfig = {
            modi = "drun, filebrowser, calc";
        };
        theme = ./config.rasi;
    };
}