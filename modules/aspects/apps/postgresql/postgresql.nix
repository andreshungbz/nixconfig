{
  pkt.postgresql = {
    # https://wiki.nixos.org/wiki/PostgreSQL
    nixos = {

    };

    darwin =
      { user, ... }:
      {
        environment.variables.PSQLRC = "${./.psqlrc}";
        home-manager.users.${user.userName}.home.sessionPath = [ "/opt/homebrew/opt/postgresql@18/bin" ];

        homebrew = {
          brews = [ "postgresql@18" ];
          casks = [ "pgadmin4" ];
        };
      };
  };
}
