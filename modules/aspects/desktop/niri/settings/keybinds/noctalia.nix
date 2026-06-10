{ inputs, ... }:
{
  pkt.niri-keybinds-noctalia = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.binds = {
        "Alt+Space".spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "launcher"
        ];

        "Mod+A".spawn = [
          "noctalia"
          "msg"
          "panel-toggle"
          "control-center"
        ];

        "Mod+L".spawn = [
          "noctalia"
          "msg"
          "session"
          "lock"
        ];

        "Mod+Pause".spawn = [
          "noctalia"
          "msg"
          "notification-dnd-toggle"
        ];

        "Mod+F9".spawn = [
          "noctalia"
          "msg"
          "mic-mute"
        ];

        "Ctrl+Print".spawn = [
          "noctalia"
          "msg"
          "screenshot-fullscreen"
          "pick"
        ];
      };
    };
  };
}
