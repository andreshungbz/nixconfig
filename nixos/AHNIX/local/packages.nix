# Local Nix Packages & Environment Variables

{ pkgs, ... }:
{
  # nix system packages
  environment.systemPackages = with pkgs; [
    # desktop
    bitwarden-desktop
    discord
    firefox
    kdePackages.filelight
    kdePackages.koi
    kdePackages.partitionmanager
    krita
    obsidian
    obs-studio
    polychromatic
    postman
    powershell
    qbittorrent
    readest
    telegram-desktop
    thunderbird
    wireshark
    zoom-us

    # command-line
    btop
    cloc
    exiftool
    ffmpeg
    ffmpegthumbnailer
    ookla-speedtest
    tldr
    tree
    wget
    yt-dlp
    wl-clipboard

    # other
    corefonts
    exfatprogs
    openrazer-daemon
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
