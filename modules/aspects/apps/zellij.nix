{
  # https://zellij.dev/
  pkt.zellij = {
    homeManager =
      { pkgs, ... }:
      {
        programs = {
          zellij = {
            enable = true;

            # enableBashIntegration = true;
            # enableZshIntegration = true;
            # enableFishIntegration = true;

            settings = {
              pane_frame_style = "full";
            };
          };
        };
      };
  };
}
