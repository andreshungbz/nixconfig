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
          nixfmt
          nvd
        ];

        programs = {
          nix-ld.enable = true;
        };
      };

    homeManager =
      { config, pkgs, ... }:
      {
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
