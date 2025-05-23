# Local Nix Packages & Environment Variables

{ pkgs, ... }:
{
  # nix system packages
  environment.systemPackages = with pkgs; [
    # desktop
    # bitwarden-desktop
    # discord
    # firefox
    # krita
    # microsoft-edge
    # obsidian
    # obs-studio
    # postman
    # powershell
    # qbittorrent
    telegram-desktop
    # wireshark
    # zoom-us

    # command-line
    # btop
    # cloc
    # exiftool
    # eza
    # ffmpeg
    # ffmpegthumbnailer
    ookla-speedtest
    # tldr
    # tree
    # wget
    # yt-dlp
  ];

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
