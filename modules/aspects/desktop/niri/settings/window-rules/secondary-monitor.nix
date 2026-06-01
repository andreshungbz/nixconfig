{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.window-rules = [
        # Discord Full Width Half Height - Secondary Monitor
        {
          matches = [ { app-id = "^discord$"; } ];

          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }

        # Vesktop Full Width Half Height - Secondary Monitor
        {
          matches = [ { app-id = "^vesktop$"; } ];

          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }

        # Telegram Full Width Half Height - Secondary Monitor
        {
          matches = [ { app-id = "^org.telegram.desktop$"; } ];
          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }
      ];
    };
  };
}
