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
  };
}
