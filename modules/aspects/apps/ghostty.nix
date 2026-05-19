{
  # https://ghostty.org/
  pkt.ghostty = {
    homeManager.programs = {
      ghostty = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        settings = {
          font-size = 11;
        };
      };
    };
  };
}
