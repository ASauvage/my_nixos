{
    description = "System installation";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        agspkgs = {
            url = "github:aylur/ags";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, agspkgs, ... } @ inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        pkgsags = agspkgs.packages.${system};
    in {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = {
                    inherit pkgs-unstable;
                    inherit pkgsags;
                };

                modules = [
                    ./configuration.nix
                    ./packages.nix
                    ./users.nix
                    ./dotfiles.nix
                ];
            };
        };
    };
}
