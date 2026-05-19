{ __findFile, ... }:
{
  pkt.nix = {
    includes = [
      <pkt/nh>
    ];

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          nixfmt # https://github.com/NixOS/nixfmt
          nvd # https://sr.ht/~khumba/nvd/
        ];

        programs = {
          # https://wiki.nixos.org/wiki/Nix-ld
          nix-ld.enable = true;
        };
      };

    homeManager =
      { config, pkgs, ... }:
      {
        home.packages = with pkgs; [
          nixfmt
          nvd
        ];

        programs.nh = {
          enable = true;
          flake = "${config.home.homeDirectory}/Projects/nixconfig";
        };
      };

    darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          nixfmt
          nvd
        ];
      };
  };
}
