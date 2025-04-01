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
        # theme = ./spotlight_dark.rasi;
    };

    home.packages = (with pkgs; [
        rofimoji
    ]);
}