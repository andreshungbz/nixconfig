{ inputs, ... }:
{
  pkt.niri-keybinds-noctalia = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.binds = {
        "Alt+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
        "Mod+A".action.spawn-sh = "noctalia msg panel-toggle control-center";
        "Mod+L".action.spawn-sh = "noctalia msg session lock";
        "Mod+Pause".action.spawn-sh = "noctalia msg notification-dnd-toggle";
        "Mod+F9".action.spawn-sh = "noctalia msg mic-mute";
        "Ctrl+Print".action.spawn-sh = "noctalia msg screenshot-fullscreen pick";
      };
    };
  };
}
