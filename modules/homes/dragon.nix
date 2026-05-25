{ den, __findFile, ... }:
{
  # General Home Setup for Non-GUI Systems
  den.homes.aarch64-linux.andresung = { };

  den.aspects.andreshung = {
    includes = [
      <pkt/git>
      <pkt/nix>
      <pkt/ssh>
      <pkt/terminal>
    ];
  };
}
