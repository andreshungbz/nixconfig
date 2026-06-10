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
