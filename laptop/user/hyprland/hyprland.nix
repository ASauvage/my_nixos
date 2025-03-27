{ inputs, config, lib, pkgs, userSettings, systemSettings, ... }:

{
    imports = [
        ./hyprpaper.nix
        ./hyprlock.nix
        ./hypridle.nix
    ];

    gtk = {
        enable = true;
        theme = {
            package = pkgs.orchis-theme;
            name = "Orchis-Teal";
        };
        cursorTheme = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Classic";
            size = 24;
        };
        iconTheme = {
            package = pkgs.gnome.adwaita-icon-theme;
            # package = pkgs.papirus-icon-theme
            name = "Adwaita";
        };
    };

    wayland.windowManager.hyprland = {
        enable = true;
        package = pkgs.hyprland;
        plugins = [ ];
        settings = { };
        extraConfig = ''
            # Hyprland; see https://wiki.hyprland.org/Configuring/
            # 
            # this file will be parsed to generate the cheatsheet,
            # so use only one variable at a time and don't use $HOME
            # or other environment variables. Don't use relative paths either.
            # 

            $hyprConfigDir = ~/.config/hypr/hyprland

            # Config files
            source = $hyprConfigDir/exec.conf
            source = $hyprConfigDir/workspace.conf
            source = $hyprConfigDir/environment.conf
            source = $hyprConfigDir/monitor.conf
            source = $hyprConfigDir/general.conf
            source = $hyprConfigDir/group.conf
            source = $hyprConfigDir/rule.conf
            source = $hyprConfigDir/input.conf
            source = $hyprConfigDir/bind.conf
            source = $hyprConfigDir/animation.conf
            source = $hyprConfigDir/decoration.conf
            source = $hyprConfigDir/layout.conf
            source = $hyprConfigDir/misc.conf
            source = $hyprConfigDir/gesture.conf
            source = $hyprConfigDir/cursor.conf
            source = $hyprConfigDir/plugin.conf

            # Apps
            source = $hyprConfigDir/apps.conf

            # xdg
            exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        '';
        xwayland.enable = true;
        systemd.enable = true;
    };

    home.file.".config/hypr/hyrpland/".source = "./hyrpland/";

    home.packages = (with pkgs; [
        kitty
        hyprland-protocols
        hyprpicker
        hyprshot
        xdg-utils
        # fnott # TODO
    ]);
    
    # services.fnott ={
    #    enable = true;
    #     settings = {
    #         main = {
    #             anchor = "bottom-right";
    #             stacking-order = "top-down";
    #             min-width = 400;
    #             title-font = userSettings.font + ":size=14";
    #             summary-font = userSettings.font + ":size=12";
    #             body-font = userSettings.font + ":size=11";
    #             border-size = 0;
    #         };
    #         low = {
    #             background = config.lib.stylix.colors.base00 + "e6";
    #             title-color = config.lib.stylix.colors.base03 + "ff";
    #             summary-color = config.lib.stylix.colors.base03 + "ff";
    #             body-color = config.lib.stylix.colors.base03 + "ff";
    #             idle-timeout = 150;
    #             max-timeout = 30;
    #             default-timeout = 8;
    #         };
    #         normal = {
    #             background = config.lib.stylix.colors.base00 + "e6";
    #             title-color = config.lib.stylix.colors.base07 + "ff";
    #             summary-color = config.lib.stylix.colors.base07 + "ff";
    #             body-color = config.lib.stylix.colors.base07 + "ff";
    #             idle-timeout = 150;
    #             max-timeout = 30;
    #             default-timeout = 8;
    #         };
    #         critical = {
    #             background = config.lib.stylix.colors.base00 + "e6";
    #             title-color = config.lib.stylix.colors.base08 + "ff";
    #             summary-color = config.lib.stylix.colors.base08 + "ff";
    #             body-color = config.lib.stylix.colors.base08 + "ff";
    #             idle-timeout = 0;
    #             max-timeout = 0;
    #             default-timeout = 0;
    #         };
    #     };
    # };
}