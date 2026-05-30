{ den, __findFile, ... }:
{
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

    homeManager = {
      home = {
        stateVersion = "26.11";
      };
    };

    darwin = {
      system = {
        checks.verifyNixPath = false;
        stateVersion = 4;
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
