{ inputs, ... }:
{
  pkt.gaming = {
    nixos =
      { pkgs, user, ... }:
      {
        imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

        environment.sessionVariables = {
          PROTON_ENABLE_WAYLAND = 1;
        };

        programs = {
          gamemode.enable = true;
          gamescope = {
            enable = true;
            capSysNice = true;
          };

          # https://wiki.nixos.org/wiki/Steam
          steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;

            extraCompatPackages = with pkgs; [ proton-ge-bin ];
            extraPackages = with pkgs; [ hidapi ];
          };
        };

        users.users.${user.userName}.packages = with pkgs; [
          dusklight
          moonlight-qt
          prismlauncher

          # emulators
          azahar
          cemu
          dolphin-emu
          melonds
          pcsx2
          ppsspp-sdl-wayland
          rmg-wayland
          ryubing

          (retroarch.withCores (
            cores: with cores; [
              bsnes
              mesen
              mgba
              sameboy
            ]
          ))
        ];

        services.flatpak.packages = [
          "org.vinegarhq.Sober"
        ];
      };

    darwin = {
      homebrew = {
        casks = [
          "steam"
        ];
      };
    };
  };
}
