# Common Home Manager Program Configurations

{
  lib,
  pkgs,
  user,
  ...
}:
let
  base =
    if pkgs.stdenv.hostPlatform.isLinux then
      "/home"
    else if pkgs.stdenv.hostPlatform.isDarwin then
      "/Users"
    else
      "";
in
{
  zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 5000;
      save = 5000;
      ignoreAllDups = true;
    };

    shellAliases = {
      ls = "eza --icons=always --color=always";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];

    initContent = lib.mkBefore ''
      eval "$(starship init zsh)"
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      # fzf-tab preview using bat
      zstyle ':fzf-tab:complete:*:*' fzf-preview '
        if [ -d "$realpath" ]; then
          eza --color=always --tree "$realpath"
        else
          bat --style=numbers --color=always --line-range=:500 "$realpath"
        fi 2>/dev/null
      '
      zstyle ':fzf-tab:*' fzf-flags --preview-window=right:60%:wrap
    '';
  };

  fzf = {
    enable = true;
  };
  eza = {
    enable = true;
  };
  bat = {
    enable = true;
  };

  starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./dotfiles/starship.toml);
  };

  git = {
    enable = true;
    userName = user.name;
    userEmail = user.email;
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
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      "AHNIX.local" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      "AHM1A.local" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };
    };
  };
}
