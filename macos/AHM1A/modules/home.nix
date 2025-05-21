{ user, pkgs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${user} = {
      home.stateVersion = "23.11";

      programs = {
        zsh.enable = true;

        git = {
          enable = true;
          userName = "Andres Hung";
          userEmail = "andres.hung@outlook.com";
          extraConfig = {
            init.defaultBranch = "main";
            pull.rebase = true;
            rebase.autoStash = true;
          };
        };

        ssh = {
          enable = true;
          matchBlocks = {
            "github.com" = {
              identitiesOnly = true;
              identityFile = [ "/Users/${user}/.ssh/id_ed25519" ];
            };
          };
        };
      };
    };
  };
}
