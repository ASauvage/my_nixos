{ config, pkgs, inputs, ... }:
let
    dotfilesRepo = builtins.fetchGit {
        url = "https://github.com/ASauvage/hyprland_dotfile.git";
        rev = "";
    };

    usersWithHome = pkgs.lib.filterAttrs (name: user: ((user.home != null) && (pkgs.lib.hasPrefix "/home/" user.home))) config.users.users;
in {
    system.activationScripts.copyDotfiles = {
        text = pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (username: user: ''
            echo "Copying dotfiles to ${username}'s .config..."

            ${pkgs.coreutils}/bin/mkdir -p "${user.home}/Documents" "${user.home}/Downloads" "${user.home}/Pictures" "${user.home}/Videos"
            
            ${pkgs.coreutils}/bin/cp -rf "${dotfilesRepo}/dotfiles/." "${user.home}"
            ${pkgs.coreutils}/bin/chown "$username" "$config_dir"
        '')usersWithHome);

        deps = [ "users" "groups" ];
    };
}