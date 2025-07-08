# Local Nix Packages

{ pkgs, lib, ... }:
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

  # PostgreSQL 17
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
    package = pkgs.postgresql_17_jit;

    # server configuration
    settings = {
      listen_addresses = lib.mkForce "*";
      port = 5432;
      jit = true;
    };

    # pg_hba.conf
    authentication = ''
      # TYPE    DATABASE        USER            ADDRESS                 METHOD
        local   all             all                                     peer
        local   all             postgres                                peer
        host    all             all             127.0.0.1/32            scram-sha-256
        host    all             all             ::1/128                 scram-sha-256
        host    all             all             192.168.18.0/24          scram-sha-256

        # Optional stricter rules:
        # host    mydb            myappuser       192.168.1.0/24          scram-sha-256
        # hostssl all             all             0.0.0.0/0               scram-sha-256
        # host    all             all             0.0.0.0/0               reject
    '';
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
