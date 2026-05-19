{
  # https://tailscale.com/
  pkt.tailscale = {
    nixos = {
      services.tailscale = {
        enable = true;
        openFirewall = true;
      };
    };
  };
}
