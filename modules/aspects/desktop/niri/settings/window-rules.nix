{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.window-rules = [
        # Global Blur (waiting for https://github.com/sodiboo/niri-flake/issues/1721)
        # {
        #   matches = [ { } ];

        #   background-effect = {
        #     blur = true;
        #     xray = true;
        #   };
        # }

        # Terminal Scratchpad
        {
          matches = [ { app-id = "kitty-scratchpad"; } ];

          open-on-output = "DP-1";
          open-floating = true;
          default-column-width.proportion = 0.6;
          default-window-height.proportion = 0.6;

          default-floating-position = {
            x = 410;
            y = 222;
            relative-to = "top-left";
          };
        }

        # Steam Full Width - Main Monitor
        {
          matches = [ { app-id = "^steam$"; } ];

          open-on-output = "DP-1";
          open-maximized = true;
        }

        # Steam Notifications Bottom Right Corner - Main Monitor
        {
          matches = [
            {
              app-id = "^steam$";
              title = "^notificationtoasts_\\d+_desktop$";
            }
          ];

          open-on-output = "DP-1";
          open-floating = true;
          open-focused = false;

          default-floating-position = {
            x = 10;
            y = 20;
            relative-to = "bottom-right";
          };
        }

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

        # Firefox PIP
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];

          open-floating = true;
        }

        # Gnome Calculator
        {
          matches = [ { app-id = "org.gnome.Calculator"; } ];

          open-floating = true;
          default-column-width.fixed = 400;
          default-window-height.fixed = 620;

          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
        }
      ];
    };
  };
}
