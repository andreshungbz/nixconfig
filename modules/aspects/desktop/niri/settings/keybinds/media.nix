{ inputs, ... }:
{
  pkt.niri-keybinds = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings.binds = {
        # Volume Up
        XF86AudioRaiseVolume = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "volume-up 5"
          ];
        };

        # Volume Down
        XF86AudioLowerVolume = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "volume-down 5"
          ];
        };

        # Volume Mute
        XF86AudioMute = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "volume-mute"
          ];
        };

        # Media Play/Pause (Toggle)
        XF86AudioPlay = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };

        # Media Play/Pause (Toggle)
        XF86AudioPause = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };

        # Media Stop
        XF86AudioStop = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "media"
            "stop"
          ];
        };

        # Media Previous
        XF86AudioPrev = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "media"
            "previous"
          ];
        };

        # Media Next
        XF86AudioNext = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "media"
            "next"
          ];
        };
      };
    };
  };
}
