{
  # https://tailscale.com/
  pkt.tailscale = {
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
