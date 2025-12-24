# Local Nix System Packages

{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    # KDE packages
    kdePackages.filelight
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kcolorchooser
    kdePackages.khelpcenter
    kdePackages.kjournald
    kdePackages.kleopatra
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.sddm-kcm

    # Razer lighting controls
    openrazer-daemon
    polychromatic

    # command-line
    btop
    # cloc # source code stats
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
    wl-clipboard

    # desktop
    blender
    discord
    cider-2
    # davinci-resolve
    firefox
    firefox-devedition
    krita
    libreoffice-qt6-fresh
    microsoft-edge
    # obsidian
    obs-studio
    prismlauncher
    qbittorrent
    # readest
    # rustdesk-flutter
    signal-desktop
    spotify
    telegram-desktop
    thunderbird
    veracrypt
    vlc
    zoom-us

    # development
    # ciscoPacketTracer8 # https://wiki.nixos.org/wiki/Packettracer
    # devtoolbox
    dnsmasq
    dnsutils
    # ghostty
    # gns3-gui
    # gns3-server
    # helix
    postman
    rpi-imager
    termius
    vscode
    warp-terminal

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
