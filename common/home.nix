# Common Home Manager Configurations

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
  git = {
    enable = true;
    settings = {
      user = {
        name = user.name;
        email = user.email;
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;

      commit.gpgSign = false;
      user.signingKey = "532A3106F50E419F";
      gpg.format = "openpgp";
    };
  };

  nh = {
    enable = true;
  };

  ssh = {
    enable = true;
    enableDefaultConfig = false;
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

      # Tailscale

      "*.ts.net" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };

      "100.*" = {
        user = "andreshung";
        identitiesOnly = true;
        identityFile = [ "${base}/${user.username}/.ssh/github" ];
      };
    };
  };

  starship = {
    enable = true;
    settings = builtins.fromTOML (builtins.readFile ./dotfiles/starship.toml);
  };

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
}
