# Shared Nix Packages

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    nvd
  ];
}
