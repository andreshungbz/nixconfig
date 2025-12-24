# Git Configuration

{ user, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = user.name;
        email = user.email;
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;

      commit.gpgSign = false;
      user.signingKey = "532A3106F50E419F";
      gpg.format = "openpgp";
    };
  };
}
