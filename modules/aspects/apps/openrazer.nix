{
  pkt.openrazer =
    { user }:
    {
      nixos =
        { pkgs, ... }:
        {
          environment.systemPackages = with pkgs; [
            openrazer-daemon
            polychromatic
          ];

          hardware.openrazer.enable = true;

          users.users.${user.userName} = {
            extraGroups = [
              "openrazer"
            ];
          };
        };
    };
}
