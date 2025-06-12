# Shared Nix Packages

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
    helix
    nixfmt-rfc-style
    nvd
  ];

  programs.zsh.enable = true;
}
