{
  pkt.postgresql = {
    # https://wiki.nixos.org/wiki/PostgreSQL
    nixos = { pkgs, ... }: {
      environment.variables.PSQLRC = "${./.psqlrc}";

      services.postgresql = {
        enable = true;
        authentication = pkgs.lib.mkOverride 10 ''
          #type database    user   address         auth-method
          local all         all                    scram-sha-256
          host  all         all    127.0.0.1/32    scram-sha-256
          host  all         all    ::1/128         scram-sha-256
          local replication all                    scram-sha-256
          host  replication all    127.0.0.1/32    scram-sha-256
          host  replication all    ::1/128         scram-sha-256
        '';
      };
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
