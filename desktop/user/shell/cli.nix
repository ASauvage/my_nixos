{ pkgs, ... }: let
    aliases = {
        # Shortcut
        downloads = "cd $XDG_DOWNLOAD_DIR/";
        documents = "cd $XDG_DOCUMENTS_DIR/";
        pictures = "cd $XDG_PICTURES_DIR/";
        music = "cd $XDG_MUSICS_DIR/";
        videos = "cd $XDG_VIDEOS_DIR/";
        repos = "cd $XDG_REPOSITORIES_DIR/";

        # System
        ls = "ls --color=auto";
        li = "ls -li";
        ll = "ls -alF";
        la = "ls -A";
        l = "ls -CF";
        rm = "rm -i";

        # Python
        py = "python3";
        createvenv = "python3 -m venv .venv --upgrade-deps && echo .venv created";
        requirements = "pip install -r requirements.*{txt, pip}";

        # QoL
        grep = "grep --color=auto";
        mongostart = "sudo systemctl start mongodb.service";
        mongostop = "sudo systemctl stop mongodb.service";
    };
in
{
    programs.bash = {
        enable = true;
        enableCompletion = true;
        initExtra = "nitch";
        shellAliases = aliases // {
            reload = "clear && nitch";
            venv = ". ./.venv/bin/activate";
        };
    };
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            set fish_greeting
            nitch
        '';
        shellAliases = aliases // {
            reload = "clear && nitch";
            venv = ". ./.venv/bin/activate.fish";
        };
    };
}