{ __findFile, ... }:
{
  pkt.sddm = {
    includes = [ <pkt/sddm-pixie> ];

    # https://wiki.nixos.org/wiki/SDDM
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ kdePackages.breeze ];

        services.displayManager.sddm = {
          enable = true;
          wayland.enable = true;
          extraPackages = with pkgs; [ kdePackages.breeze ];

          settings = {
            General.GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=1.25,XCURSOR_THEME=Breeze_Light,XCURSOR_SIZE=24";

            Theme = {
              CursorTheme = "breeze_cursors";
              CursorSize = 24;
            };
          };
        };
      };
  };
}
