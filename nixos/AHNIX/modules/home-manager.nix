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

      programs = lib.mkMerge [
        (import ../../../common/home.nix { inherit lib pkgs user; })
        (import ../../../common/modules/programs.nix { inherit lib pkgs; })
      ];
    };
  };
}
