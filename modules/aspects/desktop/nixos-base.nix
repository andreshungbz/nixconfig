{ __findFile, ... }:
{
  pkt.nixos-base = {
    includes = [
      <pkt/bluetooth>
      <pkt/ddcutil>
      <pkt/internationalization>
      <pkt/font>
      <pkt/networking>
      <pkt/nix>
      <pkt/pipewire>
      <pkt/printing>
      <pkt/security>
      <pkt/sensors>
      <pkt/ssh>
      <pkt/timezone>
      <pkt/virtualisation>
    ];
  };
}
