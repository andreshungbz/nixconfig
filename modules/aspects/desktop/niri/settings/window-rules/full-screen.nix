{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.window-rules = [
        # Steam - Main Monitor
        {
          matches = [ { app-id = "^steam$"; } ];

          open-on-output = "DP-1";
          open-maximized = true;
        }

        # Thunderbird - Main Monitor
        {
          matches = [ { app-id = "thunderbird"; } ];

          open-maximized = true;
        }
      ];
    };
  };
}
