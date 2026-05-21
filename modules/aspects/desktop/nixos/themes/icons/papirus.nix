{
  pkt.papirus-icons = {
    nixos =
      { pkgs, ... }:
      {
        environment = {
          systemPackages = with pkgs; [
            papirus-icon-theme
            adwaita-icon-theme
          ];

          sessionVariables = {
            XDG_DATA_DIRS = [ "${pkgs.papirus-icon-theme}/share" ];
            GTK_THEME_ICON = "Papirus";
          };
        };

        gtk.iconCache.enable = true;
      };
  };
}
