{
  # https://github.com/Sapd/HeadsetControl
  pkt.headsetcontrol = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          headsetcontrol
        ];

        services.udev.packages = with pkgs; [
          headsetcontrol
        ];
      };
  };
}
