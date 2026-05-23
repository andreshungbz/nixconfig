{
  test.vmvariant =
    { user }:
    {
      nixos =
        {
          config,
          modulesPath,
          ...
        }:
        {
          virtualisation.vmVariant = {
            virtualisation = {
              cores = 4;
              diskSize = 20480;
              memorySize = 4096;
            };

            # https://github.com/NixOS/nixpkgs/tree/master/nixos/modules/installer/cd-dvd
            imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];

            # disable for 26.11 warning
            boot.zfs.forceImportRoot = false;

            services.displayManager.autoLogin = {
              enable = false;
              user = user.userName;
            };
          };
        };
    };
}
