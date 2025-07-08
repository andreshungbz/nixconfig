# NixOS Network Configuration

{
  networking.hostName = "AHNIX";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 5432 ];
}
