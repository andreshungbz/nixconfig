{ den, __findFile, ... }:
{
  # General Home Setup for Non-GUI Systems
  den.homes.x86_64-linux.packet = {
    includes = [ den.aspects.unfree ];
  };
  den.homes.aarch64-linux.packet = {
    includes = [ den.aspects.unfree ];
  };

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
    };
  };
}
