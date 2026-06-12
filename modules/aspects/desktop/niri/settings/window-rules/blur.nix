{ inputs, ... }:
{
  pkt.niri-window-rules = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.window-rule = [
        {
          match._props.app-id = "org\\.telegram\\.desktop|discord|Cider";
          opacity = 0.90;
          background-effect = {
            blur = true;
            xray = true;
          };
        }
      ];
    };
  };
}
