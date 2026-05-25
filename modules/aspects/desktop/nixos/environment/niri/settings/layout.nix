{ inputs, ... }:
{
  pkt.niri-layout = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        prefer-no-csd = true;

        layout = {
          # General
          background-color = "transparent";
          gaps = 10;

          # Widths & Heights
          default-column-width.proportion = 0.5;
          preset-column-widths = [
            { proportion = 0.33; }
            { proportion = 0.5; }
            { proportion = 0.67; }
            { proportion = 1.0; }
          ];
          preset-window-heights = [
            { proportion = 0.5; }
            { proportion = 1.0; }
          ];

          # Focus Ring
          focus-ring = {
            enable = true;
            width = 2;
            urgent.color = "#fdb00b";

            active.gradient = {
              from = "#5fb8f2";
              to = "#4d6fb7";
              angle = 45;
              relative-to = "workspace-view";
            };

            inactive.gradient = {
              from = "#4d6fb7";
              to = "#2a3d66";
              angle = 45;
              relative-to = "workspace-view";
            };
          };

          # Shadow
          shadow = {
            enable = true;
            color = "#0007";
            softness = 30;
            spread = 5;
            offset = {
              x = 0;
              y = 5;
            };
          };
        };
      };
    };
  };
}
