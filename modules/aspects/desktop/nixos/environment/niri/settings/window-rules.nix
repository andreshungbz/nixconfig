{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        window-rules = [
          # Global Blur (waiting for https://github.com/sodiboo/niri-flake/issues/1721)
          # {
          #   matches = [ { } ];

          #   background-effect = {
          #     blur = true;
          #     xray = true;
          #   };
          # }
          # Steam Monitor 1
          {
            matches = [ { app-id = "^steam$"; } ];
            open-on-output = "DP-1";
            open-maximized = true;
          }
          # Discord Monitor 2
          {
            matches = [ { app-id = "^discord$"; } ];
            open-on-output = "DP-2";
            default-column-display = "normal";
            default-column-width = {
              proportion = 1.0;
            };
            default-window-height = {
              proportion = 0.5;
            };
          }
          # Telegram Monitor 2
          {
            matches = [ { app-id = "^org.telegram.desktop$"; } ];
            open-on-output = "DP-2";
            default-column-display = "normal";
            default-column-width = {
              proportion = 1.0;
            };
            default-window-height = {
              proportion = 0.5;
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
            open-floating = true;
          }
          # Terminal Scratchpad
          {
            matches = [ { app-id = "kitty-scratchpad"; } ];
            open-on-output = "DP-1";
            open-floating = true;
            default-column-width.proportion = 0.6;
            default-window-height.proportion = 0.6;
            default-floating-position = {
              x = 410;
              y = 230;
              relative-to = "top-left";
            };
          }
        ];
      };
    };
  };
}
