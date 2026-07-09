{ inputs, ... }: {
  # https://github.com/noctalia-dev/noctalia-greeter
  flake-file.inputs = {
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  pkt.noctalia-greeter = {
    nixos = { pkgs, ... }: {
      imports = [ inputs.noctalia-greeter.nixosModules.default ];

      programs.noctalia-greeter = {
        enable = true;

        greeter-args = "--session Niri";
        settings = {
          cursor = {
            theme = "Breeze_Light";
            size = 24;
            path = "${pkgs.kdePackages.breeze}/share/icons";
          };

          keyboard = {
            layout = "us";
          };

          output = {
            scale = 1.25;
            name = "DP-1";
          };
        };
      };
    };
  };
}
