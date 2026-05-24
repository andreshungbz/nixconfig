{ inputs, ... }:
{
  pkt.niri-input = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        input = {
          keyboard = {
            xkb.layout = "us";
            numlock = true;
          };

          mouse = {
            accel-speed = -0.6;
          };

          focus-follows-mouse = {
            enable = true;
            max-scroll-amount = "5%";
          };

          touchpad = {
            click-method = "button-areas";
            dwt = true;
            natural-scroll = true;
            tap = true;
          };

          trackpoint = {
            natural-scroll = false;
          };
        };
      };
    };
  };
}
