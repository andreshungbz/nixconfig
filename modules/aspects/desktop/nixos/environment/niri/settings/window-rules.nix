{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        window-rules = [
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
        ];
      };
    };
  };
}
