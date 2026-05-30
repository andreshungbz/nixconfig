{ den, __findFile, ... }:
{
  # General Home Setup for Non-GUI Systems
  den.homes.aarch64-linux.packet = { };

  den.aspects.packet = {
    includes = [
      <pkt/git>
      <pkt/nix>
      <pkt/ssh>
      <pkt/terminal>
    ];
  };
}
