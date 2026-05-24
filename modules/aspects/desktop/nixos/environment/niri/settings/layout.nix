{ inputs, ... }:
{
  pkt.niri-layout = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        layout = {
          background-color = "transparent";
          gaps = 10;

          center-focused-column = "never";

          default-column-width = {
            proportion = 0.5;
          };

          preset-column-widths = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];

          focus-ring = {
            enable = true;
            width = 2;
            active.color = "#A8AEFF";
            inactive.color = "#505050";
          };

          shadow = {
            enable = true;
            softness = 30;
            spread = 5;
            offset = {
              x = 0;
              y = 5;
            };
            color = "#0007";
          };
        };
      };
    };
  };
}
