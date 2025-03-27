{ pkgs, ... }:

{
    programs.hyprpaper = {
        enable = true;
        package = pkgs.hyprpaper;
        settings = {
            preload = [
                "~/Media/Pictures/wallpaper.png"
            ];
            wallpaper = [
                ", ~/Media/Pictures/wallpaper.png"
            ];
        };
    };
}