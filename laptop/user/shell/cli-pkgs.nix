{ pkgs, ... }:

{
    home.packages = with pkgs; [
        nitch
        # starfetch
        cava
        timer
        bat
        unzip
        wl-clipboard
        wev
        (pkgs.writeShellScriptBin "airplane-mode" ''
            #!/bin/sh
            connectivity="$(nmcli n connectivity)"
            if [ "$connectivity" == "full" ]
            then
                nmcli n off
            else
                nmcli n on
            fi
        '')
        (pkgs.writeScriptBin "rebuild" ''
            #!/bin/sh

            function show_help() {
                echo "Usage: $0 [arguments]"
                echo ""
                echo "Arguments:"
                echo "  help             Display this help message"
                echo "  home             Performs a home-manager switch"
                echo "  system           Performs a nixos-rebuild switch"
                echo "  all              Performs both a nixos-rebuild switch and a home-manager switch"
            }

            function rebuild_home() {
                home-manager switch --flake ${userSettings.dotfilesDir}/laptop#user
            }

            function rebuild_system() {
                sudo nixos-rebuild switch --flake ${userSettings.dotfilesDir}/laptop#system
            }

            while [[ $# -gt 0 ]]; do
                case "$1" in
                    help)
                        show_help
                        exit 0
                        ;;
                    home)
                        rebuild_home
                        exit 0
                        ;;
                    system)
                        rebuild_system
                        exit 0
                        ;;
                    all)
                        rebuild_system
                        rebuild_home
                        exit 0
                        ;;
                    *)
                        echo "Unknown option: $1"
                        show_help
                        exit 1
                        ;;
                esac
            done
        '')
    ];
}