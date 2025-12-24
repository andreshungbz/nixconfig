# Shared Nix Packages

{ pkgs, ... }:
{
  # nix system packages
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    nvd
  ];

  programs.zsh.enable = true;
}
