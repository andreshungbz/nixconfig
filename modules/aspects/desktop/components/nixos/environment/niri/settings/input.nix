{ inputs, ... }:
{
  pkt.niri-input = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        input = {
          # Keyboard
          keyboard = {
            xkb.layout = "us";
          };

          # Mouse
          mouse = {
            accel-speed = -0.6;
          };
          focus-follows-mouse = {
            enable = true;
            max-scroll-amount = "0%";
          };

          # Touchpad
          touchpad = {
            click-method = "button-areas";
            dwt = true;
            natural-scroll = true;
            tap = true;
          };

          # Trackpoint
          trackpoint = {
            natural-scroll = false;
          };
        };
      };
    };
  };
}
