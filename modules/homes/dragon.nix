{ den, __findFile, ... }:
{
  # General Home Setup for Non-GUI Systems
  den.homes.aarch64-linux.dragon = { };

  den.aspects.dragon = {
    includes = [
      <pkt/nix>
      <pkt/terminal>
    ];
  };
}
