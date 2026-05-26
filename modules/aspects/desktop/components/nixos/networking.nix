{ den, lib, ... }:
{
  den.quirks.firewall = {
    description = "Firewall port declarations";
  };

  pkt.networking = {
    # https://wiki.nixos.org/wiki/NetworkManager
    # https://wiki.nixos.org/wiki/Networking
    nixos =
      { firewall }:
      {
        networking = {
          networkmanager.enable = true;

          firewall = {
            enable = true;
            allowPing = true;
            allowedTCPPorts = lib.concatMap (f: f.ports or [ ]) firewall;
          };
        };

        services.resolved.enable = true;
      };
  };
}
