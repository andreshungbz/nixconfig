{ inputs, ... }:
{
  pkt.niri-binds-monitor = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        "Mod+Shift+Left".action.focus-monitor-left = [ ];
        "Mod+Shift+Right".action.focus-monitor-right = [ ];
        "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
        "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [ ];
      };
    };
  };
}
