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
      homebrew.casks = [ "tailscale-app" ];
    };
  };
}
