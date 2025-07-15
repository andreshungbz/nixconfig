# NixOS Network Configuration

{
  networking.hostName = "AHNIX";
  networking.networkmanager.enable = true;

  networking.firewall.allowedTCPPorts = [
    5432 # psql
    21114 # web console (Pro)
    21115 # NAT type test
    21116 # TCP hole punching and connection service
    21117 # relay service
    21118 # websocket (signal)
    21119 # websocket (relay)
  ];

  networking.firewall.allowedUDPPorts = [
    21116 # UDP heartbeat & ID registration
  ];
}
