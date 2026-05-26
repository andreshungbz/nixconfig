{ inputs, ... }:
{
  pkt.niri-outputs = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.outputs = {
        # Main Monitor
        "DP-1" = {
          scale = 1.25;

          mode = {
            width = 2560;
            height = 1440;
            refresh = 143.973;
          };
        };

        # Secondary Left Vertical Monitor
        "DP-2" = {
          scale = 1.25;

          mode = {
            width = 2560;
            height = 1440;
            refresh = 179.952;
          };

          position = {
            x = -1152;
            y = -775;
          };

          transform = {
            rotation = 90;
            flipped = false;
          };
        };

        # VM Testing Monitor
        "Virtual-1" = {
          scale = 1.0;

          mode = {
            width = 1920;
            height = 1080;
          };
        };
      };
    };
  };
}
