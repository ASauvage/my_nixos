{ pkgs, userSettings, ... }:

{
    home.packages = with pkgs; [
        nitch
        # starfetch
        cava
        pipes
        timer
        bat
        unzip
        wl-clipboard
        wev
        jq
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
                home-manager switch -b bak --flake ${userSettings.dotfilesDir}/laptop#user
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
        (pkgs.writeScriptBin "update-dotfiles" ''
            #!/bin/sh
            cd ${userSettings.dotfilesDir}
            git pull
            exit 0
        '')
        (pkgs.writeScriptBin "battery" ''
            #!/bin/bash

            input=$(upower -i $(upower -e | grep 'BAT') | grep -E "state|to full|percentage")

            state=$(echo "$input" | grep -oP 'state:\s+\K\w+')
            time_to_full=$(echo "$input" | grep -oP 'time to full:\s+\K[\d,\.]+ minutes')
            percentage=$(echo "$input" | grep -oP 'percentage:\s+\K\d+')

            declare -A battery_icons_charging=(
                [100]="󰂅"
                [90]="󰂋"
                [80]="󰂊"
                [70]="󰢞"
                [60]="󰂉"
                [50]="󰢝"
                [40]="󰂈"
                [30]="󰂇"
                [20]="󰂆"
                [10]="󰢜"
                [0]="󰢟"
            )

            declare -A battery_icons=(
                [100]="󰁹"
                [90]="󰂂"
                [80]="󰂁"
                [70]="󰂀"
                [60]="󰁿"
                [50]="󰁾"
                [40]="󰁽"
                [30]="󰁼"
                [20]="󰁻"
                [10]="󰁺"
                [0]="󰂃"
            )

            get_closest_battery_icon() {
                local level="$1"
                local charging="$2"
                local -n icons_array

                if [ "$charging" = "true" ]; then
                    icons_array=battery_icons_charging
                else
                    icons_array=battery_icons
                fi

                local levels=($(for key in "''${!icons_array[@]}"; do echo "$key"; done | sort -nr))

                for threshold in "''${levels[@]}"; do
                    if [ "$level" -ge "$threshold" ]; then
                        echo "''${icons_array[$threshold]}"
                        return
                    fi
                done

                echo "''${icons_array[''${levels[-1]}]}"
            }

            icon() {
                local capacity="$percentage"
                local charging="false"

                if [ "$state" = "Charging" ]; then
                    charging="true"
                fi

                get_closest_battery_icon "$capacity" "$charging"
            }

            info() {
                upower -d
            }

            status() {
                echo "$percentage%"
            }

            case $1 in
                info)
                    info
                    ;;
                icon)
                    icon
                    ;;
                status)
                    status
                    ;;
                *)
                    echo "Usage: $0 {info|icon|status}"
                    exit 1
                    ;;
            esac
        '')
    ];
}