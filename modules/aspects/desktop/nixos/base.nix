{ __findFile, ... }:
{
  pkt.nixos-base = {
    includes = [
      <pkt/bluetooth>
      <pkt/breeze-cursors>
      <pkt/internationalization>
      <pkt/font>
      <pkt/networking>
      <pkt/nix>
      <pkt/papirus-icons>
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
