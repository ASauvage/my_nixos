{ pkgs, ... }:

{
    home.packages = (with pkgs; [
        feh
        pavucontrol
        vscode
        webcord
        spotify
        gnome-calculator
        wf-recorder
        power-profiles-daemon
    ]);
}