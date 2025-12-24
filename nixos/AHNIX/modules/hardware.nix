# Hardware-related Configuration

{ pkgs, ... }:
{
  hardware = {
    openrazer.enable = true; # OpenRazer

    # makes DaVinci Resolve recognize GPU
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };
}
