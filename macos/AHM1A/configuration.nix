{ user, pkgs, ... }:
let
  shared = import ../shared/packages.nix { inherit pkgs; };
  local = import ./modules/local.nix { inherit pkgs; };
in {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  environment.systemPackages = (builtins.attrValues shared.packages)
    ++ (builtins.attrValues local.packages);

  homebrew = {
    enable = true;
    casks = shared.casks ++ local.casks;
    masApps = shared.mas // local.mas;
  };
}
