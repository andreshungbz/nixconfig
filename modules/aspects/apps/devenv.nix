{
  # https://devenv.sh/
  pkt.devenv = {
    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [ devenv ];
      };

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [ devenv ];

        # https://devenv.sh/auto-activation/
        programs.fish.interactiveShellInit = ''
          devenv hook fish | source
        '';
        programs.zsh.initContent = ''
          eval "$(devenv hook zsh)"
        '';
        programs.bash.initExtra = ''
          eval "$(devenv hook bash)"
        '';
      };

    darwin =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [ devenv ];
      };
  };
}
