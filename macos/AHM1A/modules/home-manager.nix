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
    users.${user.username} = {
      home.stateVersion = "25.05";
      home.sessionPath =
        if pkgs.stdenv.hostPlatform.isDarwin then [ "/opt/homebrew/opt/postgresql@17/bin" ] else [ ];

      imports = [
        (import ../../../common/home-manager {
          inherit lib pkgs user;
        })
      ];
    };
  };
}
