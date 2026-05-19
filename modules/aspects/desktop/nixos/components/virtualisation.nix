{
  pkt.virtualisation =
    { user }:
    {
      nixos = {
        virtualisation.docker.enable = true;

        users.users.${user.userName} = {
          extraGroups = [
            "docker"
          ];
        };
      };
    };
}
