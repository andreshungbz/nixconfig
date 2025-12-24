# Local Nix System Packages

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ookla-speedtest
  ];
}
