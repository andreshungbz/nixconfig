{
  pkt.printing = {
    # https://wiki.nixos.org/wiki/Printing
    nixos = {
      services.printing = {
        enable = true;

        drivers = [

        ];
      };

      services.ipp-usb.enable = true;
    };
  };
}
