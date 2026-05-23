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
      <pkt/dev-tools>
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
        environment = {
          systemPackages = with pkgs; [

          ];

          variables = rec {

          };
        };

        nix.settings = {
          substituters = [
            "https://niri.cachix.org"
            "https://noctalia.cachix.org"
          ];

          trusted-public-keys = [
            "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          ];
        };

        users.users.root.initialHashedPassword = lib.mkForce "$2b$05$8XN4POkJCMRkxqd//Vw0VuQWdeM9oL5vBr8qMcXcfS7mQeZrXmRCG";
      };
  };
}
