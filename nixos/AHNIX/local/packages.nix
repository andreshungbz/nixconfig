# Local Nix Packages

{ pkgs, ... }:
let
  plasmaPackages = import ./modules/plasma-packages.nix { inherit pkgs; };
in
{
  # nix system packages
  environment.systemPackages =
    with pkgs;
    [
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
    ]
    ++ plasmaPackages;

  # Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = false;
      setSocketVariable = false;
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
