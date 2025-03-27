{ pkgs, userSettings, ... }:

{
    programs.git = {
        enable = true;
        package = pkgs.git;
        userName = userSettings.name;
        userEmail = userSettings.email;
        aliases = {};
        extraConfig = {
            init.defaultBranch = "main";
            safe.directory = [
                ("/home/" + userSettings.username + "/.dotfiles")
                ("/home/" + userSettings.username + "/.dotfiles/.git")
            ];
        };
    };
}