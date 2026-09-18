{ den, __findFile, ... }:
{
  # Copy of packet.nix for systems where packet is not available
  den.homes.x86_64-linux.andreshung = { };
  den.homes.aarch64-linux.andreshung = { };

  den.aspects.andreshung = {
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
