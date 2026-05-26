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
          nixfmt
          nvd
        ];

        # https://wiki.nixos.org/wiki/Nix-ld
        programs.nix-ld.enable = true;
      };

    homeManager =
      { config, ... }:
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
