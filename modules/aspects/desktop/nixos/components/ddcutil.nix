{
  pkt.ddcutil =
    { user }:
    {
      nixos =
        { pkgs, ... }:
        {
          environment.systemPackages = with pkgs; [
            ddcutil
          ];

          hardware.i2c.enable = true;

          users.users.${user.userName} = {
            extraGroups = [
              "i2c"
            ];
          };
        };
    };
}
