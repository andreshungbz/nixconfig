{
  # https://github.com/eza-community/eza
  pkt.eza = {
    homeManager.programs = {
      eza = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        extraOptions = [
          "--icons=always"
          "--color=always"
        ];
      };
    };
  };
}
