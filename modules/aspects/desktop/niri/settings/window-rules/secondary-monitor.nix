{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.window-rule = [
        # Element
        {
          match._props.app-id = "element";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Discord
        {
          match._props.app-id = "^discord$";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Discord PTB
        {
          match._props.app-id = "^discord-ptb$";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Discord Canary
        {
          match._props.app-id = "^discord-canary$";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Vesktop
        {
          match._props.app-id = "^vesktop$";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Fluxer
        {
          match._props.app-id = "^app.fluxer.Fluxer$";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Telegram
        {
          match._props.app-id = "^org.telegram.desktop$";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }

        # Signal
        {
          match._props.app-id = "signal";
          open-on-workspace = "chat";
          default-column-display = "normal";
          default-column-width.proportion = 1.0;
          default-window-height.proportion = 1.0;
        }
      ];
    };
  };
}
