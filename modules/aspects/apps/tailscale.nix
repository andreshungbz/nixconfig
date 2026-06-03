{
  # https://tailscale.com/
  pkt.tailscale = {
    # https://wiki.nixos.org/wiki/Tailscale
    nixos = {
      services.tailscale = {
        enable = true;
        openFirewall = true;
      };
    };

    darwin = {
      # need brew for Tailscale SSH Console, but MagicDNS currently not working
      # https://github.com/tailscale/tailscale/issues/13461
      homebrew.brews = [ "tailscale" ];
    };
  };
}
