# Nix Configuration - M1 MacBook Air

{ lib, pkgs, user, ... }:
let
  # shared pkgs/casks/mas
  sharedPkgs = import ../shared/packages.nix { inherit pkgs; };
  # host-specific pkgs/casks/mas
  localPkgs = import ./local/packages.nix { inherit pkgs; };
in {
  # nix-darwin settings
  system.stateVersion = 4;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # users
  users.users.${user.username} = {
    name = user.username;
    home = "/Users/${user.username}";
    isHidden = false;
    shell = pkgs.zsh;
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

  imports = [
    ../../common/font.nix # shared fonts
    (import ../shared/macos.nix { inherit user; }) # shared MacOS settings
    ./local/macos.nix # host-specific MacOS settings
  ];

  # nix packages
  environment.systemPackages = (builtins.attrValues sharedPkgs.packages)
    ++ (builtins.attrValues localPkgs.packages);

  # homebrew packages
  homebrew = {
    enable = true;
    casks = sharedPkgs.casks ++ localPkgs.casks;
    masApps = sharedPkgs.mas // localPkgs.mas;
  };

  # environment variables
  environment.variables = { };
}
