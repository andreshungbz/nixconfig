# Local Nix Packages

{ pkgs, ... }:
{
  # nix system packages
  environment.systemPackages = with pkgs; [
    # desktop
    bitwarden-desktop
    blender
    discord
    dolphin-emu
    firefox
    ghostty
    krita
    libreoffice-qt6-fresh
    obsidian
    obs-studio
    postman
    qbittorrent
    readest
    signal-desktop
    telegram-desktop
    thunderbird
    zoom-us

    # command-line
    btop
    cloc
    exiftool
    ffmpeg
    ffmpegthumbnailer
    ookla-speedtest
    powershell
    tldr
    tree
    wget
    yt-dlp
    wl-clipboard
    # system information
    inxi
    mesa-demos
    lm_sensors
    pciutils

    # KDE
    kdePackages.filelight # disk usage
    kdePackages.koi # auto light/dark theming
    kdePackages.partitionmanager

    # Razer peripheral lighting
    openrazer-daemon
    polychromatic

    # school
    # ciscoPacketTracer8 # https://nixos.wiki/wiki/Packettracer
    gns3-gui
    gns3-server
    wireshark

    # other
    corefonts
    exfatprogs # add exFAT formatting
  ];

  # Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Multipass
  virtualisation.multipass = {
    enable = true;
  };

  # Wireshark
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Steam Remote Play
    dedicatedServer.openFirewall = true; # Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
}
