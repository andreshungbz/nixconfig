{
  inputs,
  lib,
  ...
}:
{
  # https://github.com/noctalia-dev/umbriel
  flake-file.inputs = {
    umbriel.url = "github:noctalia-dev/umbriel";
  };

  pkt.umbriel = {
    nixos =
      { pkgs, ... }:
      {
        # binary cache
        nix.settings = {
          substituters = [ "https://umbriel.cachix.org" ];
          trusted-public-keys = [ "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw=" ];
        };

        imports = [ inputs.umbriel.nixosModules.default ];

        programs.umbriel.enable = true;

        services.gnome.gnome-keyring.enable = true;
        security.pam.services.greetd.enableGnomeKeyring = true;
        security.pam.services.login.enableGnomeKeyring = true;
      };

    homeManager =
      { pkgs, ... }:
      {
        imports = [ inputs.umbriel.homeModules.default ];

        programs.umbriel = {
          enable = true;
          settings = builtins.readFile ./config.toml;
        };
      };
  };
}
