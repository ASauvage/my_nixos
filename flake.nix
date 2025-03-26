{
    description = "NixOS system installation";

    inputs = {};

    outputs = { self, ... }: let
        
    in {
        templates = {
            server = {
                description = ''
                    Server flake - (no gui).
                    Contains the bare minimum for a home server.
                '';
                path = ./server;
            };
            laptop = {
                description = ''
                    Laptop flake - (Hyprland).
                    Augmented with boilerplate for custom packages, overlays, and reusable modules.
                '';
                path = ./laptop;
            };
        };
    };
}