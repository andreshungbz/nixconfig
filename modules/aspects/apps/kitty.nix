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

        settings = {
          background_opacity = 0.75;
          background_blur = 1;
          window_padding_width = 8;
        };
      };
    };
  };
}
