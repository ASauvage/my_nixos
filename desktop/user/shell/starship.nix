{ pkgs, lib, ... }:

{
    programs.starship = {
        enable = true;
        package = pkgs.starship;
        enableBashIntegration = false;
        enableFishIntegration = true;
    };
    
    xdg.configFile."starship.toml".source = ./starship.toml;

}