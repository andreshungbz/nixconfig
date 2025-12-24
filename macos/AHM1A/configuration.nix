# AHM1A Configuration

{
  lib,
  pkgs,
  user,
  ...
}:
{
  system.stateVersion = 4;
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    # local settings
    ./modules

    # shared settings
    ../shared
    ../../common/font.nix
  ];
}
