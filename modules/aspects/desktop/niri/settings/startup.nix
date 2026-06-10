{ inputs, ... }:
{
  pkt.niri-startup = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings = {
        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          {
            _args = [ "noctalia" ];
          }
        ];
      };
    };
  };
}
