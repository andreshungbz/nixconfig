{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.window-rule = [
        # Discord Full Width Half Height - Secondary Monitor
        {
          match._props.app-id = "^discord$";
          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }

        # Discord Canary Full Width Half Height - Secondary Monitor
        {
          match._props.app-id = "^discord-canary$";
          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }

        # Vesktop Full Width Half Height - Secondary Monitor
        {
          match._props.app-id = "^vesktop$";
          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }

        # Telegram Full Width Half Height - Secondary Monitor
        {
          match._props.app-id = "^org.telegram.desktop$";
          open-on-output = "DP-2";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 0.5;
        }
      ];
    };
  };
}
