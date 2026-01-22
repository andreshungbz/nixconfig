# Git Configuration

{ user, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = user.name;
        email = "2018118240@ub.edu.bz"; # user.email
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;

      commit.gpgSign = false;
      user.signingKey = "532A3106F50E419F";
      gpg.format = "openpgp";

      # for the school semester
      core.editor = "nano";
      color.ui = "auto";
    };
  };
}
