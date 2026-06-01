{ inputs, ... }:
{
  pkt.niri-keybinds = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings.binds = {
        # Niri
        "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
        "Ctrl+Alt+Delete".action.quit = [ ];
        "Mod+O".action.toggle-overview = [ ];
        "Mod+Q".action.close-window = [ ];

        # Noctalia
        "Alt+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
        "Mod+A".action.spawn-sh = "noctalia msg panel-toggle control-center";
        "Mod+L".action.spawn-sh = "noctalia msg session lock";
        "Mod+Pause".action.spawn-sh = "noctalia msg notification-dnd-toggle";

        # Applications
        "Mod+B".action.spawn = "firefox";
        "Mod+T".action.spawn = "kitty";
        "Mod+S".action.spawn = [
          "kitty"
          "--class"
          "kitty-scratchpad"
        ];
        "Mod+E".action.spawn = [
          "nautilus"
          "--new-window"
        ];
      };
    };
  };
}
