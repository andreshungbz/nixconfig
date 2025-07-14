# Configurable Programs

{ pkgs, lib, ... }:
{
  # Docker
  # https://nixos.wiki/wiki/Docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = false;
      setSocketVariable = false;
    };
  };

  # GPG
  programs.gnupg = {
    agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-tty;
    };
  };

  # Multipass
  virtualisation.multipass = {
    enable = true;
  };

  # Nix-ld
  programs.nix-ld.enable = true;

  # PostgreSQL 17
  # https://nixos.wiki/wiki/PostgreSQL
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
        host    all             all             192.168.18.0/24         scram-sha-256
        host    all             all             172.17.0.0/24           scram-sha-256

        # Optional stricter rules:
        # host    mydb            myappuser       192.168.1.0/24          scram-sha-256
        # hostssl all             all             0.0.0.0/0               scram-sha-256
        # host    all             all             0.0.0.0/0               reject
    '';
  };

  # Steam
  # https://nixos.wiki/wiki/Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # Tailscale
  # https://nixos.wiki/wiki/Tailscale
  services.resolved.enable = true;
  services.tailscale = {
    enable = true;
  };

  # VirtualBox
  # https://nixos.wiki/wiki/VirtualBox
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  # Wireshark
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
}
