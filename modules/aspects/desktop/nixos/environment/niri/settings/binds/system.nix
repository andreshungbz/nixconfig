{ inputs, ... }:
{
  pkt.niri-binds-system = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
        "Ctrl+Alt+Delete".action.quit = [ ];

        "Mod+T".action.spawn = "kitty";
        "Mod+E".action.spawn = [
          "nautilus"
          "--new-window"
        ];
        "Alt+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
        "Mod+L".action.spawn-sh = "noctalia msg screen-lock";
      };
    };
  };
}
