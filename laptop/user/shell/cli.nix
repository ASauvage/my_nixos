{ pkgs, ... }: let
    aliases = {
        # Shortcut
        desktop = "cd ~/Desktop";
        downloads = "cd ~/Downloads";
        documents = "cd ~/Documents";
        pictures = "cd ~/Pictures";
        music = "cd ~/Music";
        videos = "cd ~/Videos";
        repos = "cd /media/DATA/repositories";

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