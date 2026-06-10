{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.window-rule = [
        # Steam - Main Monitor
        {
          match._props.app-id = "^steam$";
          open-on-output = "DP-1";
          open-maximized = true;
        }

        # Thunderbird
        {
          match._props.app-id = "thunderbird";
          open-maximized = true;
        }
      ];
    };
  };
}
