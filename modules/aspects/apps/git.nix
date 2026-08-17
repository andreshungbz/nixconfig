{
  # https://git-scm.com/
  pkt.git = {
    homeManager.programs.git = {
      enable = true;

      signing = {
        format = "ssh";
        key = "~/.ssh/id_ed25519.pub";
        signByDefault = false;
      };

      settings = {
        user = {
          name = "Andres Hung";
          email = "2018118240@ub.edu.bz";
        };

        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}
