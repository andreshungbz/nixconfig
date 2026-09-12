{ inputs, ... }:
{
  pkt.niri-keybinds-noctalia = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.binds = {
        "Alt+Space".spawn-sh = "noctalia msg panel-toggle launcher";
        "Mod+A".spawn-sh = "noctalia msg panel-toggle control-center";
        "Mod+Alt+L".spawn-sh = "noctalia msg session lock";
        "Mod+Pause".spawn-sh = "noctalia msg notification-dnd-toggle";
        "Pause".spawn-sh = "noctalia msg mic-mute";
        "Print".spawn-sh = "noctalia msg screenshot-region";
        "Mod+Print".spawn-sh = "noctalia msg screenshot-fullscreen pick";
      };
    };
  };
}
