{ inputs, pkgs, pkgs-unstable, pkgsags, userSettings, ... }:

{
    imports = [
        ./hyprland/hyprland.nix
    ];

    home = {
        username = userSettings.username;
        homeDirectory = "/home/" + userSettings.username;
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        steam
    ];

    xdg.enable = true;
    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        music = "${config.home.homeDirectory}/Media/Music";
        videos = "${config.home.homeDirectory}/Media/Videos";
        pictures = "${config.home.homeDirectory}/Media/Pictures";
        templates = "${config.home.homeDirectory}/Templates";
        download = "${config.home.homeDirectory}/Downloads";
        documents = "${config.home.homeDirectory}/Documents";
        desktop = null;
        publicShare = null;
        extraConfig = {
            XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
            XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/Archive";
        };
    };

    home.sessionVariables = {
        EDITOR = userSettings.editor;
        SPAWNEDITOR = userSettings.spawnEditor;
        TERM = userSettings.term;
        BROWSER = userSettings.browser;
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    home.stateVersion = "24.11";
}