{ inputs, ... }:
{
  pkt.niri-startup = {
    imports = [ inputs.niri-nix.homeModules.default ];

    homeManager = {
      wayland.windowManager.niri.settings = {
        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          { _args = [ "noctalia" ]; }
          { _args = [ "Telegram" ]; }
          { _args = [ "discord" ]; }
          { _args = [ "discordptb" ]; }
          { _args = [ "discordcanary" ]; }
          { _args = [ "element-desktop" ]; }
          { _args = [ "signal-desktop" ]; }
          { _args = [ "cider-2" ]; }
          { _args = [ "steam" ]; }
          { _args = [ "thunderbird" ]; }
        ];
      };
    };
  };
}
