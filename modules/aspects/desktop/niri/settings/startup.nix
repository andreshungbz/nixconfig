{ inputs, ... }:
{
  pkt.niri-startup = {
    imports = [ inputs.niri.homeModules.niri ];

    homeManager = {
      programs.niri.settings = {
        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          {
            command = [ "noctalia" ];
          }
        ];
      };
    };
  };
}
