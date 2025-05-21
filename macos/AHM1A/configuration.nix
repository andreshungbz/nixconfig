{ user, pkgs, lib, ... }:
let
  sharedPkgs = import ../shared/packages.nix { inherit pkgs; };
  localPkgs = import ./modules/packages.nix { inherit pkgs; };
in {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${user.username} = {
    name = user.username;
    home = "/Users/${user.username}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  system.stateVersion = 4;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${user.username} = {
      home.stateVersion = "23.11";
      programs = import ../../common/home.nix { inherit lib user pkgs; };
    };
  };

  imports = [
    (import ../shared/macos.nix { inherit user; }) # shared settings
    ./modules/macos.nix # extend settings
  ];

  environment.systemPackages = (builtins.attrValues sharedPkgs.packages)
    ++ (builtins.attrValues localPkgs.packages);

  homebrew = {
    enable = true;
    casks = sharedPkgs.casks ++ localPkgs.casks;
    masApps = sharedPkgs.mas // localPkgs.mas;
  };
}
