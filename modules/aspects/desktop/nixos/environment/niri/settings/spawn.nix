{ inputs, ... }:
{
  pkt.niri-spawn = {
    imports = [
      (inputs.niri.homeModules.niri or { })
    ];

    homeManager = {
      programs.niri.settings = {
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
