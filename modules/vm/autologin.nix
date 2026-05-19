{ lib, ... }:
{
  test.autologin =
    { user }:
    {
      nixos =
        { config, ... }:
        lib.mkIf config.services.displayManager.enable {
          services.displayManager.autoLogin = {
            enable = true;
            user = user.userName;
          };

          users.users.${user.userName}.initialPassword = "password";
        };
    };
}
