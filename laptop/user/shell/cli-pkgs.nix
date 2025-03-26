{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nitch
    # starfetch
    cava
    killall
    libnotify
    timer
    brightnessctl
    bat
    unzip
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
    vim
  ];
}