{
  den,
  lib,
  __findFile,
  ...
}:
{
  den.aspects.unfree = {
    homeManager.nixpkgs.config.allowUnfree = true;
  };

  den.default = {
    includes = [
      <den/define-user>
      <den/hostname>
      <den/mutual-provider>
    ];

    nixos = {
      system.stateVersion = "26.11";

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      home-manager = {
        backupFileExtension = "backup";
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    };

    homeManager = { lib, ... }: {
      home = {
        stateVersion = "26.11";
      };
    };

    darwin = {
      nix.enable = false;

      system = {
        checks.verifyNixPath = false;
        stateVersion = 7;
      };

      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      home-manager = {
        backupFileExtension = "backup";
        useUserPackages = true;
        useGlobalPkgs = true;
      };
    };
  };
}
