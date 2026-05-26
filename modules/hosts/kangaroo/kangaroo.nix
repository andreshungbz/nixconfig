{
  den,
  lib,
  __findFile,
  ...
}:
{
  # ASUS AMD Gaming Desktop
  den.hosts.x86_64-linux.kangaroo = {
    users.andreshung.classes = [ "homeManager" ];
  };

  den.aspects.kangaroo = {
    includes = [
      den.aspects.kangaroo-computer
      # den.aspects.kangaroo-disko
    ];

    provides.andreshung = {
      includes = [
        <pkt/desktop-apps>
        <pkt/dev-tools>
        <pkt/gaming>
        <pkt/niri>
        <pkt/nixos-base>
        <pkt/noctalia>
        <pkt/sddm>
        <pkt/terminal>
      ];
    };

    # Impromptu Configurations
    nixos =
      { pkgs, lib, ... }:
      {
        users.users.root.initialHashedPassword = lib.mkForce "$2b$05$8XN4POkJCMRkxqd//Vw0VuQWdeM9oL5vBr8qMcXcfS7mQeZrXmRCG";

        environment = {
          systemPackages = with pkgs; [

          ];

          variables = {

          };
        };
      };
  };
}
