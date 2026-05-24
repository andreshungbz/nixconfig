{ inputs, ... }:
{
  pkt.niri-outputs = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        outputs = {
          "Virtual-1" = {
            mode = {
              width = 1920;
              height = 1080;
            };
            scale = 1.0;
          };

          "DP-1" = {
            mode = {
              width = 2560;
              height = 1440;
              refresh = 143.973;
            };

            scale = 1.25;
          };

          "DP-2" = {
            mode = {
              width = 2560;
              height = 1440;
              refresh = 179.952;
            };
            scale = 1.25;

            transform = {
              rotation = 90;
              flipped = false;
            };

            position = {
              x = -1152;
              y = -775;
            };
          };
        };
      };
    };
  };
}
