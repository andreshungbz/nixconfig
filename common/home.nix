{ user, lib, pkgs, ... }:
let
  base = if pkgs.stdenv.hostPlatform.isLinux then
    "/home"
  else if pkgs.stdenv.hostPlatform.isDarwin then
    "/Users"
  else
    "";
in {
  zsh = {
    enable = true;
    initContent = lib.mkBefore ''
      eval "$(starship init zsh)"
    '';
  };

  starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./dotfiles/starship.toml);
  };

  git = {
    enable = true;
    userName = "Andres Hung";
    userEmail = "andres.hung@outlook.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };

  ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        identitiesOnly = true;
        identityFile = [ "${base}/${user}/.ssh/id_ed25519" ];
      };
    };
  };
}
