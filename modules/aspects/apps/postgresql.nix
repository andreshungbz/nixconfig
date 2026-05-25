{
  pkt.postgresql = {
    darwin =
      { user, ... }:
      {
        home-manager.users.${user.userName}.home.sessionPath = [
          "/opt/homebrew/opt/postgresql@18/bin"
        ];

        homebrew = {
          brews = [
            "postgresql@18"
          ];

          casks = [
            "pgadmin4"
          ];
        };
      };
  };
}
