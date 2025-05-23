# Shared Nix Packages & Environment Variables

{ pkgs, ... }:
{
  # nix system packages
  environment.systemPackages = with pkgs; [
    # desktop
    firefox-devedition
    vscode
    warp-terminal

    # command-line
    nixfmt-rfc-style
    fastfetch
  ];

  programs.zsh.enable = true;
}
