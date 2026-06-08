{ inputs, lib, ... }:
{
  # https://docs.noctalia.dev/v5/
  flake-file.inputs = {
    noctalia.url = "github:noctalia-dev/noctalia";
  };

  pkt.noctalia = {
    nixos =
      { pkgs, ... }:
      {
        # binary cache
        nix.settings = {
          substituters = [ "https://noctalia.cachix.org" ];
          trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
        };

        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        services = {
          power-profiles-daemon.enable = true; # power profiles
          upower.enable = true; # battery
          # networkmanager and bluetooth already enabled in nixos-base
        };
      };

    homeManager = {
      imports = [ inputs.noctalia.homeModules.default ];

      # repository avatars/wallpapers
      home.file."Pictures/nixconfig-avatars".source = ./avatars;
      home.file."Pictures/Wallpapers/nixconfig-wallpapers".source = ./wallpapers;

      programs.noctalia = {
        enable = true;
        settings = builtins.readFile ./config.toml;
      };
    };
  };
}
