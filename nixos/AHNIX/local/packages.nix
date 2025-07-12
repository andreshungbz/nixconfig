# Local Nix System Packages

{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    # KDE packages
    kdePackages.filelight
    kdePackages.kleopatra
    kdePackages.koi
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.sddm-kcm

    # Razer lighting controls
    openrazer-daemon
    polychromatic

    # command-line
    btop
    cloc
    cryptsetup
    devcontainer
    exiftool
    exfatprogs # exFAT formatting
    ffmpeg
    ffmpegthumbnailer
    gnupg
    ookla-speedtest
    powershell
    tldr
    tree
    wget
    yt-dlp
    wl-clipboard

    # desktop
    bitwarden-desktop
    blender
    discord
    dolphin-emu
    firefox
    krita
    libreoffice-qt6-fresh
    obsidian
    obs-studio
    qbittorrent
    readest
    signal-desktop
    telegram-desktop
    thunderbird
    vlc
    zoom-us

    # development
    # ciscoPacketTracer8 # https://nixos.wiki/wiki/Packettracer
    ghostty
    gns3-gui
    gns3-server
    helix
    postman
    warp-terminal
    wireshark

    # sensors
    inxi
    mesa-demos
    lm_sensors
    pciutils

    # other
    corefonts # Microsoft TrueType
  ];

  imports = [ ./programs.nix ];
}
