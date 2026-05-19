{ inputs, ... }:
{
  pkt.gaming =
    { user }:
    {
      nixos =
        { pkgs, ... }:
        {
          imports = [
            (inputs.nix-flatpak.nixosModules.nix-flatpak or { })
          ];

          users.users.${user.userName}.packages = with pkgs; [
            prismlauncher
          ];

          programs = {
            steam = {
              enable = true;
              remotePlay.openFirewall = true;
              dedicatedServer.openFirewall = true;
              localNetworkGameTransfers.openFirewall = true;
              gamescopeSession.enable = true;
            };
          };

          services.flatpak = {
            packages = [
              "org.vinegarhq.Sober"
            ];
          };
        };
    };
}
