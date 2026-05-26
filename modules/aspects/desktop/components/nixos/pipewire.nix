{
  # https://www.pipewire.org/
  pkt.pipewire = {
    # https://wiki.nixos.org/wiki/PipeWire
    nixos = {
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # jack.enable = true;
      };
    };
  };
}
