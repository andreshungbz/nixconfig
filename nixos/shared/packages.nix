# Shared Nix Packages

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt
    nvd
  ];
}
