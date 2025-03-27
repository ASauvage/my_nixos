{ inputs, pkgs, ... }:

{
    imports = [
        inputs.agspkgs.homeManagerModules.default
    ];

    programs.ags = {
        enable = true;
        # configDir = ./ags;

        # additional packages to add to gjs's runtime
        extraPackages = with pkgs; [
            inputs.agspkgs.packages.${pkgs.system}.battery
            inputs.agspkgs.packages.${pkgs.system}.bluetooth
            inputs.agspkgs.packages.${pkgs.system}.cava
            inputs.agspkgs.packages.${pkgs.system}.notifd
            inputs.agspkgs.packages.${pkgs.system}.hyprland
            inputs.agspkgs.packages.${pkgs.system}.mpris
            inputs.agspkgs.packages.${pkgs.system}.network
            inputs.agspkgs.packages.${pkgs.system}.tray
            inputs.agspkgs.packages.${pkgs.system}.wireplumber
        ];
    };
}