{
  pkt.homebrew = {
    darwin = {
      homebrew.enable = true;

      home-manager = {
        programs.fish.interactiveShellInit = ''
          eval "$(/opt/homebrew/bin/brew shellenv)"
        '';
        programs.zsh.initContent = ''
          eval "$(/opt/homebrew/bin/brew shellenv)"
        '';
        programs.bash.initExtra = ''
          eval "$(/opt/homebrew/bin/brew shellenv)"
        '';
      };
    };
  };
}
