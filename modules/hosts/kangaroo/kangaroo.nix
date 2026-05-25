{
  den,
  lib,
  __findFile,
  ...
}:
{
  # ASUS Gaming Desktop Workstation
  den.hosts.x86_64-linux.kangaroo = {
    users = {
      andreshung = {
        classes = [ "homeManager" ];
      };
    };
  };

  den.aspects.kangaroo = {
    includes = [
      den.aspects.kangaroo-computer
      # den.aspects.kangaroo-disk
      <pkt/nixos-base>
    ];

    provides.andreshung = {
      includes = [
        <pkt/breeze-cursors>
        <pkt/desktop-apps>
        <pkt/dev-tools>
        <pkt/extra>
        <pkt/gaming>
        <pkt/git>
        <pkt/kitty>
        <pkt/nautilus>
        <pkt/niri>
        <pkt/noctalia>
        <pkt/papirus-icons>
        <pkt/sddm>
        <pkt/ssh>
        <pkt/terminal>
      ];
    };

    # Impromptu Configurations
    nixos =
      { pkgs, lib, ... }:
      {
        environment = {
          systemPackages = with pkgs; [

          ];

          variables = rec {

          };
        };

        users.users.root.initialHashedPassword = lib.mkForce "$2b$05$8XN4POkJCMRkxqd//Vw0VuQWdeM9oL5vBr8qMcXcfS7mQeZrXmRCG";
      };
  };
}
