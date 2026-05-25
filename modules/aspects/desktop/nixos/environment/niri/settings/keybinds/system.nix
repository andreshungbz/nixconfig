{ inputs, ... }:
{
  pkt.niri-binds-system = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        # Niri
        "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
        "Ctrl+Alt+Delete".action.quit = [ ];
        "Mod+O".action.toggle-overview = [ ];
        "Mod+Q".action.close-window = [ ];

        # Noctalia
        "Alt+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
        "Mod+L".action.spawn-sh = "noctalia msg screen-lock";

        # Applications
        "Mod+B".action.spawn = "firefox";
        "Mod+T".action.spawn = "kitty";
        "Mod+Shift+T".action.spawn = [
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
