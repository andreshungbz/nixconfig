# Zsh Configuration

{ pkgs, lib, ... }:
{
  programs.zsh = {
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
