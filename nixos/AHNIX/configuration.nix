{
  lib,
  pkgs,
  user,
  ...
}:
{
  system.stateVersion = "25.11";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ../../common/font.nix
    ../shared/modules # shared NixOS settings
    ./local/modules # local NixOS settings
    ../shared/packages.nix # shared packages
    ./local/packages.nix # local packages
  ];

  # users
  users = {
    users = {
      ${user.username} = {
        description = user.name;
        isNormalUser = true;
        shell = pkgs.zsh;

        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "openrazer"
          "vboxusers"
          "wireshark"
        ];
      };
    };
  };

  # home manager (module)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${user.username} = {
      home.stateVersion = "25.05";
      programs = import ../../common/home.nix { inherit lib pkgs user; };
    };
  };

  # environment variables
  environment.sessionVariables = rec {
    # disable adaptive brightness on monitor for KDE Wayland
    POWERDEVIL_NO_DDCUTIL = "1";
  };

  # host-specific configurations
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.loader.grub.gfxmodeEfi = "2560x1440";
  hardware.openrazer.enable = true;
  services.flatpak.enable = true;
  programs.kdeconnect.enable = true;
}
