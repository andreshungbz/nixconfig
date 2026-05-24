{ inputs, ... }:
{
  pkt.niri-binds-media = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        # Volume Up
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-up 5"
          ];
        };

        # Volume Down
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-down 5"
          ];
        };

        # Volume Mute
        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-mute"
          ];
        };

        # Media Play/Pause (Toggle)
        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };

        # Media Play/Pause (Toggle)
        "XF86AudioPause" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };

        # Media Stop
        "XF86AudioStop" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "stop"
          ];
        };

        # Media Previous
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "previous"
          ];
        };

        # Media Next
        "XF86AudioNext" = {
          allow-when-locked = true;
          action.spawn = [
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
