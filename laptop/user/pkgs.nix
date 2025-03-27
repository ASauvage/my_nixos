{ pkgs, ... }:

{
    home.packages = (with pkgs; [
        feh
        pavucontrol
    ]);
}