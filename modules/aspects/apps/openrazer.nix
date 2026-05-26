{
  # https://openrazer.github.io/
  pkt.openrazer = {
    # https://wiki.nixos.org/wiki/Hardware/Razer
    nixos =
      { pkgs, user, ... }:
      {
        environment.systemPackages = with pkgs; [
          openrazer-daemon
          polychromatic
        ];

        hardware.openrazer.enable = true;
        users.users.${user.userName}.extraGroups = [ "openrazer" ];
      };
  };
}
