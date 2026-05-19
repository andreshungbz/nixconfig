{
  # https://sw.kovidgoyal.net/kitty/
  pkt.kitty = {
    homeManager.programs = {
      kitty = {
        enable = true;

        shellIntegration = {
          enableBashIntegration = true;
          enableZshIntegration = true;
          enableFishIntegration = true;
        };

        font = {
          name = "JetBrainsMono Nerd Font";
          size = 11;
        };
      };
    };
  };
}
