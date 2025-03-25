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
        webcord

        anyrun
        pavucontrol
        pipewire
        brightnessctl
        wget

        (where-is-my-sddm-theme.override {
            variants = ["qt5"];
        })
    ];

    fonts.packages = with pkgs; [
        # inputs.nixpkgs-unstable.packages.${system}.nerd-fonts.space-mono
        # nerdfonts
    ];
}
