{ inputs, ... }:
{
  pkt.niri-binds-utilities = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        # Screenshot
        "Print".action.screenshot = [ ];
        "Ctrl+Print".action.screenshot-screen = [ ];
        "Alt+Print".action.screenshot-window = [ ];
      };
    };
  };
}
