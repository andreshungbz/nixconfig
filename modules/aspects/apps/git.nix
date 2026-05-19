{
  # https://git-scm.com/
  pkt.git = {
    homeManager = {
      programs.git = {
        enable = true;

        signing = {
          format = "ssh";
          key = "~/.ssh/id_ed25519.pub";
          signByDefault = true;
        };

        settings = {
          user = {
            name = "Andres Hung";
            email = "andres.hung@outlook.com";
          };

          init.defaultBranch = "main";
          pull.rebase = true;
        };
      };
    };
  };
}
