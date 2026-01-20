# Shared Nix System Packages

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    helix
    nixfmt
  ];
}
