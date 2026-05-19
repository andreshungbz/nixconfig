{
  den,
  inputs,
  lib,
  ...
}:
{
  # enable angle bracket syntax
  # https://den.denful.dev/guides/namespaces/#enabling-angle-brackets
  _module.args.__findFile = den.lib.__findFile;

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })

    # namespaces
    (inputs.den.namespace "pkt" true)
    (inputs.den.namespace "test" false)
  ];

  flake-file.inputs = {
    den.url = "github:denful/den";

    flake-file.url = "github:vic/flake-file";

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
