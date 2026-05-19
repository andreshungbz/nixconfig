{ den, __findFile, ... }:
{
  den.aspects.andreshung = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
    ];

    nixos = {
      users.users.andreshung = {
        isNormalUser = true;
        description = "Andres Hung";
      };
    };

    homeManager = {
      # useful for setting an icon when testing, but probably conflicts in real setups.
      # home.file.".face.icon".source = ./avatar.png;
    };
  };
}
