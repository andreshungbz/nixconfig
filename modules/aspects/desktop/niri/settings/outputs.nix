{ inputs, ... }:
{
  pkt.niri-outputs = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.output = [
        # Main Monitor
        {
          _args = [ "DP-1" ];
          scale = 1.25;
          mode = "2560x1440@143.973";
        }

        # Secondary Left Vertical Monitor
        {
          _args = [ "DP-2" ];
          scale = 1.25;
          mode = "2560x1440@179.952";
          transform = "90";
          position._props = {
            x = -1152;
            y = -775;
          };
        }

        # VM Testing Monitor
        {
          _args = [ "Virtual-1" ];
          scale = 1.0;
          mode = "1920x1080";
        }
      ];
    };
  };
}
