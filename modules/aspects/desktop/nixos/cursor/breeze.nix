{
  pkt.breeze-cursor = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          kdePackages.breeze-icons
        ];
      };

    homeManager =
      { pkgs, ... }:
      {
        home.pointerCursor = {
          package = pkgs.kdePackages.breeze-icons;
          name = "breeze_cursors";
          size = 24;

          gtk.enable = true;
          x11.enable = true;
        };

        gtk.enable = true;
        xdg.enable = true;
      };
  };
}
