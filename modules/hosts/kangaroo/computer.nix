{
  den.aspects.kangaroo-computer = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ ./_hardware.nix ];

        boot.initrd.kernelModules = [ "amdgpu" ];
        boot.kernelPackages = pkgs.linuxPackages_latest;

        boot.loader = {
          efi.canTouchEfiVariables = true;
          systemd-boot.enable = false;
          timeout = 5;

          grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
            efiInstallAsRemovable = false;
            useOSProber = true;
            fontSize = 24;
            font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
            gfxmodeEfi = "2560x1440";
            extraEntries = ''
              menuentry "Enter BIOS Setup" {
                fwsetup
              }
            '';
          };
        };

        hardware = {
          amdgpu.opencl.enable = true;

          graphics = {
            enable = true;
            enable32Bit = true;
          };
        };

        zramSwap.enable = true;
      };
  };
}
