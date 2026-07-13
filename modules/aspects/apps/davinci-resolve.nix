{
  # https://wiki.nixos.org/wiki/DaVinci_Resolve
  pkt.davinci-resolve = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ davinci-resolve ];

        environment.variables = {
          RUSTICL_ENABLE = "radeonsi";
        };

        hardware.graphics = {
          extraPackages = with pkgs; [ mesa.opencl ];
        };
      };
  };
}
