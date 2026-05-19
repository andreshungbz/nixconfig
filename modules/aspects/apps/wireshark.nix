{
  # https://www.wireshark.org/
  pkt.wireshark =
    { user }:
    {
      nixos =
        { pkgs, ... }:
        {
          programs.wireshark = {
            enable = true;
            dumpcap.enable = true;
            usbmon.enable = true;
          };

          users.users.${user.userName} = {
            packages = with pkgs; [
              wireshark
            ];

            extraGroups = [
              "wireshark"
            ];
          };
        };
    };
}
