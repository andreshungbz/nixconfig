{ inputs, ... }:
{
  pkt.niri-spawn = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
        hotkey-overlay.skip-at-startup = true;

        spawn-at-startup = [
          {
            command = [
              "noctalia"
            ];
          }
          {
            command = [
              "Telegram"
            ];
          }
          {
            command = [
              "discord"
            ];
          }
        ];
      };
    };
  };
}
