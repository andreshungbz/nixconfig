{ inputs, ... }:
{
  pkt.niri-keybinds = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.binds = {
        # Niri
        "Mod+Shift+Slash".show-hotkey-overlay = [ ];
        "Ctrl+Alt+Delete".quit = [ ];
        "Mod+O".toggle-overview = [ ];
        "Mod+Q".close-window = [ ];

        # Applications
        "Mod+B".spawn = "firefox";
        "Mod+T".spawn = "kitty";
        "Mod+S".spawn = [
          "kitty"
          "--class"
          "kitty-scratchpad"
        ];
        "Mod+E".spawn = [
          "nautilus"
          "--new-window"
        ];
      };
    };
  };
}
