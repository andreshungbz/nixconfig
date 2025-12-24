# GRUB Configuration

{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 5;
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        fontSize = 24;
        font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
        gfxmodeEfi = "2560x1440"; # Grub resolution
        extraEntries = ''
          menuentry "Enter BIOS Setup" {
            fwsetup
          }
        '';
      };
    };

    initrd.kernelModules = [ "amdgpu" ]; # AMD GPU resolution
    kernelPackages = pkgs.linuxPackages_latest; # use latest Linux kernel
  };
}
