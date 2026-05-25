{ lib, ... }:
{
  # https://fishshell.com/
  pkt.fish = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs.fishPlugins; [
          # fzf-fish # https://github.com/PatrickF1/fzf.fish
          colored-man-pages # https://github.com/PatrickF1/colored_man_pages.fish
        ];

        programs.fish = {
          enable = true;

          interactiveShellInit = ''
            set fish_greeting
          '';
        };
      };

    darwin =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.shell = lib.mkForce pkgs.fish;
      };
  };
}
