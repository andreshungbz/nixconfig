{
  # https://github.com/LizardByte/Sunshine
  pkt.sunshine = {
    # https://wiki.nixos.org/wiki/Sunshine
    nixos =
      { pkgs, user, ... }:
      {
        services.sunshine = {
          enable = true;
          autoStart = true;
          capSysAdmin = true;
          openFirewall = true;
        };

        users.users.${user.userName}.extraGroups = [ "uinput" ];
      };

    darwin = {
      homebrew.casks = [ "moonlight" ];
    };
  };
}
