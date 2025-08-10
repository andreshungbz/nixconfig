# Configurable Programs

{ pkgs, lib, ... }:
{
  # Docker
  # https://wiki.nixos.org/wiki/Docker/en
  virtualisation.docker = {
    enable = true;
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

  # https://wiki.nixos.org/wiki/Fwupd
  services.fwupd.enable = true;

  # PostgreSQL 17
  # https://wiki.nixos.org/wiki/PostgreSQL
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

  # RustDesk Server
  # https://wiki.nixos.org/wiki/RustDesk
  # services.rustdesk-server = {
  #   enable = true;
  #   openFirewall = true;
  #   signal.relayHosts = [ "ahnix.coydog-matrix.ts.net:21117" ];
  # };

  # Steam
  # https://wiki.nixos.org/wiki/Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # Tailscale
  # https://wiki.nixos.org/wiki/Tailscale
  services.resolved.enable = true;
  services.tailscale = {
    enable = true;
  };

  # Virt-manager
  # https://wiki.nixos.org/wiki/Virt-manager
  programs.virt-manager.enable = true;
  virtualisation = {
    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
    };
  };

  # Wireshark
  programs.wireshark = {
    enable = true;
    dumpcap.enable = true;
    usbmon.enable = true;
  };
}
