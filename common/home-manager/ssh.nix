# SSH Configuration

{ pkgs, user, ... }:
let
  base =
    if pkgs.stdenv.hostPlatform.isLinux then
      "/home"
    else if pkgs.stdenv.hostPlatform.isDarwin then
      "/Users"
    else
      "";
in
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      "AHNIX.local" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      "AHM1A.local" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      # Tailscale

      "*.ts.net" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      "100.*" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };
    };
  };
}
