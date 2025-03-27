{ pkgs, ... }:

{
    import = [
        ./python-pkgs.nix
    ];
    
    home.packages = (with pkgs; [
        python3Full
    ]);
}