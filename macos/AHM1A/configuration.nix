{ user, pkgs, ... }:
let
  sharedPkgs = import ../shared/packages.nix { inherit pkgs; };
  localPkgs = import ./modules/packages.nix { inherit pkgs; };
in {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    (import ../shared/macos.nix { inherit user; }) # shared settings
    ./modules/macos.nix # extend settings
    ./modules/home.nix
  ];

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  environment.systemPackages = (builtins.attrValues sharedPkgs.packages)
    ++ (builtins.attrValues localPkgs.packages);

  homebrew = {
    enable = true;
    casks = sharedPkgs.casks ++ localPkgs.casks;
    masApps = sharedPkgs.mas // localPkgs.mas;
  };
}
