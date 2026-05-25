{ den, ... }:
{
  # nh exposition
  perSystem =
    { pkgs, ... }:
    {
      packages = den.lib.nh.denPackages { fromFlake = true; } pkgs;
    };

  # https://github.com/nix-community/nh
  pkt.nh =
    { user }:
    {
      nixos = {
        programs.nh = {
          enable = true;
          flake = "/home/${user.userName}/Projects/nixconfig";
        };
      };
    };
}
