{
  pkt.sensors = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          inxi
          mesa-demos
          lm_sensors
          pciutils
        ];
      };
  };
}
