{
  test.boot = {
    nixos =
      { modulesPath, ... }:
      {
        # https://github.com/NixOS/nixpkgs/tree/master/nixos/modules/installer/cd-dvd
        imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

        # disable for 26.11 warning
        boot.zfs.forceImportRoot = false;
      };
  };
}
