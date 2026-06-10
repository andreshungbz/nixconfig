{ inputs, ... }:
{
  pkt.niri-layout = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings = {
        prefer-no-csd = true; # no client-side decorations

        layout = {
          # General
          background-color = "transparent";
          gaps = 10;

          # Width/Height Defaults & Presets
          default-column-width.proportion = 0.5;
          preset-column-widths._children = [
            { proportion = 0.33333; }
            { proportion = 0.5; }
            { proportion = 0.66667; }
            { proportion = 1.0; }
          ];
          preset-window-heights._children = [
            { proportion = 0.5; }
            { proportion = 1.0; }
          ];

          # Window Focus Ring
          focus-ring = {
            width = 2;
          };
        };
      };
    };
  };
}
