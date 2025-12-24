# MAIN Configuration

{
  lib,
  pkgs,
  user,
  ...
}:
{
  home = {
    stateVersion = "25.05";
    username = user.username;
    homeDirectory = "/home/${user.username}";
  };

  imports = [
    (import ../../common/home-manager {
      inherit lib pkgs user;
    })
  ];
}
