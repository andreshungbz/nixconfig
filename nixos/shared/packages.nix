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
    fastfetch
    nixfmt-rfc-style
  ];

  programs.zsh.enable = true;
}
