{ pkgs, ... }:

{
    hardware.graphics.enable = true;
    hardware.graphics.extraPackages = with pkgs; [
        rocmPackages.clr.icd
    ];
}