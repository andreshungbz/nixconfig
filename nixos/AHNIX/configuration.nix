{ lib, pkgs, user, ... }: {
  system.stateVersion = "25.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
    ../../common.font.nix
    ../shared/modules # shared NixOS settings
    ./local/modules # local NixOS settings
    ../shared/packages.nix # shared packages
    ./local/packages.nix # local packages
  ];

  # users
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      ${user.username} = {
        description = user.name;
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];
      };
    };
  };

  # home manager (module)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user.username} = {
      home.stateVersion = "25.05";
      programs = import ../../common/home.nix { inherit lib pkgs user; };
    };
  };

  # environment variables
  environment.sessionVariables = rec { };

  # host-specific configurations
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.loader.grub.gfxmodeEfi = "2560x1440";
}
