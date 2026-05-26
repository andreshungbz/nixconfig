{
  pkt.bluetooth = {
    # https://wiki.nixos.org/wiki/Bluetooth
    nixos = {
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };
  };
}
