{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.window-rule = [
        # Cider
        {
          match._props.app-id = "^cider$";
          open-on-workspace = "media";
          open-maximized = true;
        }

        # Steam - Main Monitor
        {
          match._props.app-id = "^steam$";
          open-on-workspace = "main";
          open-maximized = true;
        }

        # Thunderbird
        {
          match._props.app-id = "thunderbird";
          open-on-workspace = "work";
          open-maximized = true;
        }
      ];
    };
  };
}
