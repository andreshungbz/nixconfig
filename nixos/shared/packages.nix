# Shared Nix Packages

{ pkgs, ... }:
{
  # nix system packages
  environment.systemPackages = with pkgs; [
    firefox-devedition
    vscode

    nixfmt-rfc-style
    nvd
  ];

  programs.zsh.enable = true;
}
