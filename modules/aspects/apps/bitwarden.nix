{
  # https://bitwarden.com/
  pkt.bitwarden = {
    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [
          bitwarden-desktop
        ];

        environment.variables = rec {
          SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
        };
      };

    darwin = {
      homebrew.casks = [ "bitwarden" ];

      environment.variables = rec {
        SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
      };
    };
  };
}
