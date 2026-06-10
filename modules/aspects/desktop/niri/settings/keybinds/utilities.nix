{ inputs, ... }:
{
  pkt.niri-keybinds = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings = {
        # Screenshot
        screenshot-path = "~/Pictures/Screenshots/screenshot-%Y-%m-%d %H-%M-%S.png";
        binds = {
          "Print".action.screenshot = [ ];
          "Alt+Print".action.screenshot-window = [ ];
        };
      };
    };
  };
}
