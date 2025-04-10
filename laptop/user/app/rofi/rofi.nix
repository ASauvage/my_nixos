{ pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
        cycle = false;
        plugins = (with pkgs;[
            rofi-calc
            rofi-emoji-wayland
        ]);
        extraConfig = {
            modi = "drun,filebrowser,calc";
        };
        # theme = ./custom_theme.rasi;
    };

}