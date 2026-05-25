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
      <pkt/desktop-apps>
      <pkt/extra>
      <pkt/gaming>
      # <pkt/kde>
      <pkt/nautilus>
      <pkt/sddm>
      <pkt/nixos-base>
    ];

    provides.andreshung = {
      includes = [
        <pkt/breeze-cursors>
        <pkt/dev-tools>
        <pkt/git>
        <pkt/kitty>
        <pkt/niri>
        <pkt/noctalia>
        <pkt/papirus-icons>
        <pkt/ssh>
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

          variables = rec {

          };
        };
      };
  };
}
