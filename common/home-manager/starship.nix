# Starship Configuration

{ lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ../dotfiles/starship.toml);
  };
}
