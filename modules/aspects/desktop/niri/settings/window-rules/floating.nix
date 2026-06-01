{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.window-rules = [
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

        # Firefox PIP
        {
          matches = [
            {
              app-id = "firefox$";
              title = "^Picture-in-Picture$";
            }
          ];

          open-on-output = "DP-1";
          open-floating = true;
          open-focused = false;

          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
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
