{
  pkt.ssh = {
    nixos = {
      services.openssh = {
        enable = true;
        ports = [ 22 ];
        settings = {
          UseDns = true;
          X11Forwarding = true;
          PasswordAuthentication = true;
          KbdInteractiveAuthentication = true;
          AllowAgentForwarding = "yes";
        };
      };
    };

    homeManager = {
      home.file = {
        ".ssh/id_ed25519.pub".text = ''
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/
        '';

        ".ssh/authorized_keys".text = ''
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/
        '';
      };

      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;

        settings = {
          "*.ts.net" = {
            identitiesOnly = true;
            identityFile = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K";
          };
        };
      };
    };
  };
}
