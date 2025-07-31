{
  description = "Andres' Nix Configurations for MacOS & NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      darwin,
    }:
    let
      user = {
        username = "andreshung";
        name = "Andres Hung";
        email = "andres.hung@outlook.com";
      };
    in
    {
      darwinConfigurations = {
        "AHM1A" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit user; };
          modules = [
            home-manager.darwinModules.home-manager
            ./macos/AHM1A/configuration.nix
          ];
        };
      };

      nixosConfigurations = {
        "AHNIX" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs user; };
          modules = [
            home-manager.nixosModules.home-manager
            ./nixos/AHNIX/configuration.nix

            # overlays
            # (
            #   { config, pkgs, ... }:
            #   {
            #     nixpkgs.overlays = [
            #       (final: prev: {
            #         docker = inputs.nixpkgs-stable.legacyPackages.${final.system}.docker;
            #       })
            #     ];
            #   }
            # )
          ];
        };
      };
    };
}
