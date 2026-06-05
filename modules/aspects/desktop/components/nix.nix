{ den, ... }:
{
  # nh exposition
  # https://den.denful.dev/reference/lib/#denlibnh
  perSystem =
    { pkgs, ... }:
    {
      packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
    };

  pkt.nix = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          nil
          nixd
          nixfmt
          nvd
        ];

        # https://wiki.nixos.org/wiki/Nix-ld
        programs.nix-ld.enable = true;
      };

    homeManager =
      { config, pkgs, ... }:
      {
        programs.nh = {
          enable = true;
          flake = "${config.home.homeDirectory}/Projects/nixconfig";
        };

        home.packages = with pkgs; [
          nixfmt
          nvd
        ];
      };

    darwin =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          nil
          nixd
          nixfmt
          nvd
        ];
      };
  };
}
