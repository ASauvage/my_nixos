{ config, pkgs, ... }:

{
    imports = [
        ./pipewire.nix
        ./fonts.nix
    ];

    environment.systemPackages = with pkgs; [ 
        wayland
        vim
        wget
        kitty
        killall
        libnotify
        brightnessctl
        (where-is-my-sddm-theme.override {
            variants = ["qt6"];
            themeConfig.General = {
                cursorBlinkAnimation = true;
                passwordCursorColor = "";
                hideCursor = false;
                # showSessionsByDefault=false
                # showUsersByDefault=false
                # showUserRealNameByDefault=true
            };
        })
    ];

    services.xserver = {
        enable = true;
        xkb = {
            layout = "fr";
            variant = "";
            options = "caps:escape";
        };
    };
}