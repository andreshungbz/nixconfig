{
  pkt.breeze-cursors = {
    nixos =
      { pkgs, ... }:
      {
        environment = {
          systemPackages = with pkgs; [
            kdePackages.breeze-icons
          ];

          sessionVariables = {
            XDG_DATA_DIRS = [ "${pkgs.kdePackages.breeze-icons}/share" ];
            XCURSOR_THEME = "breeze_cursors";
            XCURSOR_SIZE = "24";
          };
        };
      };
  };
}
