{ config, pkgs, pkgs-unstable, pkgsags, ... }:
{
    environment.systemPackages = 
        (with pkgs; [
            kitty
            fish
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
            (writeTextDir "share/sddm/themes/where_is_my_sddm_theme_qt5/theme.conf.user" ''
                [General]
                cursorBlinkAnimation=true
                passwordCursorColor=
            '')
        ])

        ++
        
        (with pkgs-unstable; [
            ags
            foot
        ])

        ++

        (with pkgsags; [
            battery
            hyprland
            network
        ]);

    fonts.packages = with pkgs-unstable; [
        nerd-fonts.space-mono
    ];
}
