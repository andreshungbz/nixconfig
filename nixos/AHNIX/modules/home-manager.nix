# Home Manager Module Configuration

{
  lib,
  pkgs,
  user,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${user.username} = {
      home.stateVersion = "25.05";

      imports = [
        (import ../../../common/home-manager {
          inherit lib pkgs user;
        })
      ];
    };
  };
}
