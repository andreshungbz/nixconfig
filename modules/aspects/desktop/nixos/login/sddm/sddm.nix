{ __findFile, ... }:
{
  pkt.sddm = {
    includes = [
      <pkt/sddm-pixie>
    ];

    nixos = {
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
