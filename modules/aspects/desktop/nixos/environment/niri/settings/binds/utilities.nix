{ inputs, ... }:
{
  pkt.niri-binds-utilities = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        "Print".action.screenshot = [ ];
        "Ctrl+Print".action.screenshot-screen = [ ];
        "Alt+Print".action.screenshot-window = [ ];
        "Mod+Shift+P".action.power-off-monitors = [ ];
      };
    };
  };
}
