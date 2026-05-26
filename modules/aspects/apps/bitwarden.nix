{
  # https://bitwarden.com/
  # https://bitwarden.com/help/ssh-agent/#configure-bitwarden-ssh-agent
  pkt.bitwarden = {
    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [ bitwarden-desktop ];
        environment.variables.SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
      };

    darwin = {
      homebrew.casks = [ "bitwarden" ];
      environment.variables.SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
    };
  };
}
