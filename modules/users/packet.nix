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
        initialHashedPassword = "$2b$05$8XN4POkJCMRkxqd//Vw0VuQWdeM9oL5vBr8qMcXcfS7mQeZrXmRCG";
      };
    };

    homeManager = {
      # useful for setting an icon when testing, but probably conflicts in real setups.
      # home.file.".face.icon".source = ./avatar.png;
    };

    darwin = {
      users.users.andreshung = {
        isHidden = false;
        description = "Andres Hung";
        home = "/Users/andreshung";
      };
    };
  };
}
