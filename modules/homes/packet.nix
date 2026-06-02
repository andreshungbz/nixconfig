{ den, __findFile, ... }:
{
  # General Home Setup for Non-GUI Systems
  den.homes.x86_64-linux.packet = { };
  den.homes.aarch64-linux.packet = { };

  den.aspects.packet = {
    includes = [
      <pkt/devenv>
      <pkt/git>
      <pkt/nix>
      <pkt/ssh>
      <pkt/terminal>
    ];

    homeManager = {
      programs.home-manager.enable = true;

      home.file.".ssh/authorized_keys" = {
        text = ''
          ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/
        '';
        onChange = "chmod 600 ~/.ssh/authorized_keys";
      };
    };
  };
}
