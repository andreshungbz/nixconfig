# NixOS mDNS & Samba Configuration
# https://wiki.nixos.org/wiki/Samba

{
  services.avahi = {
    nssmdns4 = true;
    enable = true;
    ipv4 = true;
    ipv6 = true;
    publish = {
      enable = true;
      addresses = true;
      userServices = true;
      workstation = true;
    };
    extraConfig = ''
      [server]
      deny-interfaces=virbr0,mpqemubr0,docker0,veth*
    '';
  };

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  services.resolved = {
    enable = true;
    extraConfig = ''
      [Resolve]
      MulticastDNS=no
    '';
  };

  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "AHNIX Samba";
        "netbios name" = "AHNIX";
        "security" = "user";
        # "use sendfile" = "yes";
        # # "max protocol" = "smb2";
        # "hosts allow" = "192.168.0.0/16 127.0.0.1 localhost";
        # "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };
      "public" = {
        "path" = "/srv/samba/public";
        "browseable" = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
        "create mask" = "0444";
        "directory mask" = "0555";
      };
      "private" = {
        "path" = "/srv/samba/private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
