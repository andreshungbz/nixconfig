# MAIN Configuration

{
  lib,
  pkgs,
  user,
  ...
}:
{
  home.stateVersion = "25.05";

  imports = [
    (import ../../common/home-manager {
      inherit lib pkgs user;
    })
  ];
}
