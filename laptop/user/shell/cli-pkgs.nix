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
    ];
}