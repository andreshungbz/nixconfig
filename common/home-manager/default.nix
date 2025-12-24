# Configuration Bundle

{
  lib,
  pkgs,
  user,
  ...
}:
{
  imports = [
    (import ./git.nix { inherit lib pkgs user; })
    (import ./programs.nix { inherit lib pkgs user; })
    (import ./ssh.nix { inherit lib pkgs user; })
    (import ./starship.nix { inherit lib pkgs user; })
    (import ./zsh.nix { inherit lib pkgs user; })
  ];
}
