{
  pkt.breeze-cursors = {
    homeManager =
      { pkgs, ... }:
      {
        home.pointerCursor = {
          package = pkgs.kdePackages.breeze;
          name = "Breeze_Light";
          size = 24;
          gtk.enable = true;
          x11.enable = true;
        };

        gtk = {
          enable = true;
          cursorTheme = {
            package = pkgs.kdePackages.breeze;
            name = "Breeze_Light";
            size = 24;
          };
        };
      };
  };
}
