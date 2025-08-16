# Local Nix System Packages

{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    # KDE packages
    karp
    kdePackages.alligator
    kdePackages.drkonqi
    kdePackages.filelight
    # kdePackages.kamoso
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.khelpcenter
    kdePackages.kjournald
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
    cloc # source code stats
    cryptsetup # LUKS encryption
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
    davinci-resolve
    dolphin-emu
    firefox
    krita
    libreoffice-qt6-fresh
    librewolf
    microsoft-edge
    obsidian
    obs-studio
    prismlauncher
    qbittorrent
    readest
    rustdesk-flutter
    signal-desktop
    spotify
    telegram-desktop
    thunderbird
    veracrypt
    vlc
    zoom-us

    # development
    # ciscoPacketTracer8 # https://wiki.nixos.org/wiki/Packettracer
    devcontainer
    devtoolbox
    dnsmasq
    dnsutils
    ghostty
    gns3-gui
    gns3-server
    helix
    postman
    rpi-imager
    termius
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
