{ den, __findFile, ... }:
{
  den.aspects.packet = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
    ];

    nixos = {
      users.users.packet = {
        description = "Andres Hung";
      };
    };

    homeManager = {
      # useful for setting an icon when testing, but probably conflicts in real setups.
      # home.file.".face.icon".source = ./avatar.png;
    };
  };
}
