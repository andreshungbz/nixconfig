{ inputs, lib, ... }:
{
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
    };
  };

  # https://docs.noctalia.dev/v5/
  pkt.noctalia = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        services = {
          power-profiles-daemon.enable = true; # power profiles
          upower.enable = true; # battery
        };

        # binary cache
        nix.settings = {
          substituters = [ "https://noctalia.cachix.org" ];
          trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
        };
      };

    homeManager = {
      imports = [
        (inputs.noctalia.homeModules.default or { })
      ];

      # repository wallpapers
      home.file."Pictures/Wallpapers/nixconfig-wallpapers".source = ./nixconfig-wallpapers;

      programs.noctalia = {
        enable = true;
        settings = builtins.readFile ./config.toml;
      };
    };
  };
}
