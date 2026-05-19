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
      <pkt/desktop-apps>
      <pkt/dev-tools>
      <pkt/extra>
      <pkt/gaming>
      <pkt/kde>
      <pkt/nixos-base>
    ];

    provides.andreshung = {
      includes = [
        <pkt/git>
        <pkt/kitty>
        <pkt/ssh>
        <pkt/terminal>
      ];
    };

    # Impromptu Configurations
    nixos =
      { pkgs, ... }:
      {
        environment = {
          systemPackages = with pkgs; [

          ];

          variables = rec {

          };
        };
      };
  };
}
