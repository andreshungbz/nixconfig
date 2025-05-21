{
  description = "M1 MacBook Air Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin }:
    let
      user = {
        username = "andreshung";
        name = "Andres Hung";
        email = "andres.hung@outlook.com";
      };
    in {
      darwinConfigurations."AHM1A" = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit user; };
        modules = [
          { nixpkgs.config.allowUnfree = true; }
          home-manager.darwinModules.home-manager
          ./macos/AHM1A/configuration.nix
        ];
      };
    };
}
