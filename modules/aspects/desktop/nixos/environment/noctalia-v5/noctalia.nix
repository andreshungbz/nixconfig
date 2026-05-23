{ inputs, lib, ... }:
{
  flake-file.inputs = {
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/v5";
    };
  };

  pkt.noctalia = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];

        environment.variables = {
          QS_ICON_THEME = "Papirus";
        };

        services = {
          power-profiles-daemon.enable = true;
          upower.enable = true;
        };
      };

    homeManager = {
      imports = [
        (inputs.noctalia.homeModules.default or { })
      ];

      home.file."Pictures/Wallpapers/default-wallpapers".source = ./default-wallpapers;

      programs.noctalia = {
        enable = true;
        settings = builtins.readFile ./config.toml;
      };
    };
  };
}
