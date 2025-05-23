# Local Nix Packages & Environment Variables

{ pkgs, ... }: {
  # nix system packages
  environment.systemPackages = with pkgs; [ telegram-desktop ];

  # Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Steam Remote Play
    dedicatedServer.openFirewall = true; # Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
}
