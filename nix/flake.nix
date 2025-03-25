{
    description = "System installation";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };

    outputs = { nixpkgs, nixpkgs-unstable, ... } @ inputs:
    let
        system = "x86_64-linux";
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
                ./packages.nix
                ./users.nix
                ./dotfiles.nix
            ];
        };
    };
}
