{ inputs, __findFile, ... }:
{
  den.aspects.kangaroo = {
    includes = [
      <test/vmvariant>
    ];
  };

  perSystem =
    { pkgs, system, ... }:
    {
      # nix run .#vm-kangaroo
      packages =
        if system != "x86_64-linux" then
          { }
        else
          {
            vm-kangaroo = pkgs.writeShellApplication {
              name = "vm-kangaroo";
              text = ''
                ${inputs.self.nixosConfigurations.kangaroo.config.system.build.vm}/bin/run-kangaroo-vm "$@"
              '';
            };
          };
    };
}
