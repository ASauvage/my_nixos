{ pkgs, ... }:

{
    home.packages = (with pkgs; [
        feh
        pavucontrol
        vscode
        webcord
        spotify
        qalculate-gtk
    ]);
}