{ inputs, ... }:
{
  pkt.niri-binds-utilities = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        # Screenshot
        screenshot-path = "~/Pictures/Screenshots/screenshot-%Y-%m-%d %H-%M-%S.png";
        binds = {
          "Print".action.screenshot = [ ];
          "Ctrl+Print".action.screenshot-screen = [ ];
          "Alt+Print".action.screenshot-window = [ ];
        };
      };
    };
  };
}
