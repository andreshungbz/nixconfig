{ __findFile, ... }:
{
  pkt.darwin-base = {
    includes = [
      <pkt/ccenter>
      <pkt/cuprefs>
      <pkt/dock>
      <pkt/finder>
      <pkt/font>
      <pkt/nix>
      <pkt/nsgd>
      <pkt/security>
      <pkt/ssh>
      <pkt/startup>
      <pkt/trackpad>
    ];
  };
}
