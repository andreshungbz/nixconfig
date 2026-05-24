{ inputs, ... }:
{
  pkt.niri-binds-media = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings.binds = {
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-up 5"
          ];
        };

        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-down 5"
          ];
        };

        "XF86AudioMute" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "volume-mute"
          ];
        };

        "XF86AudioPlay" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };

        "XF86AudioPause" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "toggle"
          ];
        };

        "XF86AudioStop" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "stop"
          ];
        };

        "XF86AudioPrev" = {
          allow-when-locked = true;
          action.spawn = [
            "noctalia"
            "msg"
            "media"
            "previous"
          ];
        };

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
