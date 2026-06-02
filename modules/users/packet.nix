{ den, __findFile, ... }:
{
  den.aspects.packet = {
    includes = [
      <den/primary-user>
      (<den/user-shell> "fish")
    ];

    nixos = {
      users.users.packet = {
        isNormalUser = true;
        description = "Andres Hung";
        initialHashedPassword = "$2b$05$8XN4POkJCMRkxqd//Vw0VuQWdeM9oL5vBr8qMcXcfS7mQeZrXmRCG";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/"
        ];
      };
    };

    homeManager = {
      # useful for setting an icon when testing, but probably conflicts in real setups.
      # home.file.".face.icon".source = ./avatar.png;
    };

    darwin = {
      users.users.packet = {
        isHidden = false;
        description = "Andres Hung";
        home = "/Users/packet";

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJSHAzMVnHblW0xy4tdMxCZBpEsDRlh+khOMmYzJs5K/"
        ];
      };
    };
  };
}
