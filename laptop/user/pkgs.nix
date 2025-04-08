{ pkgs, ... }:

{
    home.packages = (with pkgs; [
        feh
        pavucontrol
        vscode
        webcord
        spotify
        gnome-calculator
        gnome-text-editor
        gnome-disk-utility
        deluge
        vlc
        anydesk
        postman
        mongodb-compass
        melonDS
        mgba
        wf-recorder
        
    ]);
}