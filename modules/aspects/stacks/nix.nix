{ den, ... }:
{
  # nh exposition
  perSystem =
    { pkgs, ... }:
    {
      packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
    };

  pkt.nix = {
    nixos =
      { pkgs, user, ... }:
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
