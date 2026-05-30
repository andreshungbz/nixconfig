{
  pkt.proton = {
    nixos =
      { pkgs, ... }:
      {
        networking.firewall.checkReversePath = false;

        environment.systemPackages = with pkgs; [
          proton-vpn
          wireguard-tools
        ];
      };

    darwin = {
      homebrew.casks = [
        "protonvpn"
      ];
    };
  };
}
