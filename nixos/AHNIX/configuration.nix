# AHNIX Configuration

{
  lib,
  pkgs,
  user,
  ...
}:
{
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    # local settings
    ./hardware-configuration.nix
    ./modules

    # shared settings
    ../shared/modules
    ../shared/packages.nix
    ../../common/font.nix
  ];
}
