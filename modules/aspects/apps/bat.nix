{
  # https://github.com/sharkdp/bat
  pkt.bat = {
    homeManager.programs = {
      bat = {
        enable = true;
        config = {
          theme = "Dracula";
        };
      };

      bash.shellAliases.cat = "bat";
      zsh.shellAliases.cat = "bat";
      fish.shellAliases.cat = "bat";
    };
  };
}
