{ pkgs, ... }:

{
    programs.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings = {
            preload = [
                "~/Pictures/wallpaper.png"
            ];
            wallpaper = [
                ", ~/Pictures/wallpaper.png"
            ];
        };
    };
}