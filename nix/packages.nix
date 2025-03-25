{ config, pkgs, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        kitty
        fish
        foot
        starship
        
        nitch
        vim

        hyprpaper
        hyprlock
        hypridle
        hyprshot
        hyprcursor
        waybar

        firefox
        nautilus
        vscode
        spotify

        anyrun
        pipewire
        brightnessctl
        wget
    ];

    fonts.packages = with pkgs; [
        # nerd-fonts.space-mono
        nerdfonts
    ];
}
