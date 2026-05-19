{
  pkt.bitwarden =
    { user }:
    {
      nixos =
        { pkgs, ... }:
        {
          users.users.${user.userName}.packages = with pkgs; [
            bitwarden-desktop
          ];

          environment.variables = rec {
            SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
          };
        };
    };
}
