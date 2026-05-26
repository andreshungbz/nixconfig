{ __findFile, ... }:
{
  pkt.nixos-base = {
    includes = [
      <pkt/bluetooth>
      <pkt/ddcutil>
      <pkt/extra>
      <pkt/internationalization>
      <pkt/font>
      <pkt/networking>
      <pkt/nix>
      <pkt/pipewire>
      <pkt/printing>
      <pkt/security>
      <pkt/sensors>
      <pkt/timezone>

      <pkt/breeze-cursors>
      <pkt/papirus-icons>
      <pkt/ssh>
    ];
  };
}
