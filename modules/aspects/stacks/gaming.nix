{ inputs, ... }:
{
  pkt.gaming = {
    nixos =
      { pkgs, user, ... }:
      {
        imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

        programs = {
          gamemode.enable = true;

          # https://wiki.nixos.org/wiki/Steam
          steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;

            extraPackages = with pkgs; [ hidapi ];
          };
        };

        users.users.${user.userName}.packages = with pkgs; [
          dusklight
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
