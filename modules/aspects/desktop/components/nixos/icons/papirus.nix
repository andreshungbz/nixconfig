{
  pkt.papirus-icons = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ papirus-icon-theme ];
      };

    homeManager = {
      gtk = {
        enable = true;
        iconTheme.name = "Papirus";
      };
    };
  };
}
