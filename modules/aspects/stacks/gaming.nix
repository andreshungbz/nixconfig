{ inputs, ... }:
{
  pkt.gaming = {
    nixos =
      { pkgs, user, ... }:
      {
        imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

        # https://wiki.nixos.org/wiki/Steam
        programs.steam = {
          enable = true;
          remotePlay.openFirewall = true;
          dedicatedServer.openFirewall = true;
          localNetworkGameTransfers.openFirewall = true;
          gamescopeSession.enable = true;
        };

        users.users.${user.userName}.packages = with pkgs; [
          prismlauncher
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
