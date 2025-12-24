{
  description = "Andres' Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
      # MacOS Configurations
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

      # NixOS Configurations
      nixosConfigurations = {
        "AHNIX" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs user; };
          modules = [
            home-manager.nixosModules.home-manager
            ./nixos/AHNIX/configuration.nix
          ];
        };
      };

      # Home Manager Standalone Configurations
      homeConfigurations = {
        "MAIN-ARM" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-linux;
          extraSpecialArgs = { inherit user; };
          modules = [
            ./home/MAIN/home.nix
          ];
        };
      };
    };
}
