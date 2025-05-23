# Shared Nix Packages & Environment Variables

{ pkgs, ... }: {
  # nix system packages
  environment.systemPackages = with pkgs; [ nixfmt-rfc-style ];

  programs.zsh.enable = true;
}
