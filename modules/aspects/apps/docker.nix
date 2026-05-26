{
  # https://www.docker.com/
  pkt.docker = {
    # https://wiki.nixos.org/wiki/Docker
    nixos =
      { user, ... }:
      {
        virtualisation.docker.enable = true;
        users.users.${user.userName}.extraGroups = [ "docker" ];
      };

    darwin = {
      homebrew = {
        casks = [ "homebrew/cask/docker-desktop" ];
      };
    };
  };
}
