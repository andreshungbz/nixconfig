{
  # https://www.wireshark.org/
  pkt.wireshark = {
    nixos =
      { pkgs, user, ... }:
      {
        programs.wireshark = {
          enable = true;
          dumpcap.enable = true;
          usbmon.enable = true;
        };

        users.users.${user.userName} = {
          packages = with pkgs; [ wireshark ];
          extraGroups = [ "wireshark" ];
        };
      };

    darwin = {
      homebrew.casks = [ "wireshark-app" ];
    };
  };
}
