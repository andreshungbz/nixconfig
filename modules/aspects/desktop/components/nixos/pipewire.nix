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

        # AirPlay/RAOP
        raopOpenFirewall = true;
        extraConfig.pipewire = {
          "10-airplay" = {
            "context.modules" = [
              {
                name = "libpipewire-module-raop-discover";

                # increase the buffer size if you get dropouts/glitches
                # args = {
                #   "raop.latency.ms" = 500;
                # };
              }
            ];
          };
        };
      };
    };
  };
}
