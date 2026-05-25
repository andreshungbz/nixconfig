{
  # https://devenv.sh/
  pkt.devenv =
    { user }:
    {
      nixos =
        { pkgs, ... }:
        {
          users.users.${user.userName}.packages = with pkgs; [ devenv ];
        };

      homeManager = {
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

      darwin = {
        users.users.${user.userName}.packages = with pkgs; [ devenv ];
      };
    };
}
