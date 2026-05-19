{ inputs, __findFile, ... }:
{
  den.aspects.kangaroo = {
    includes = [
      <test/autologin>
      <test/boot>
      <test/vmvariant>
    ];
  };

  perSystem =
    { pkgs, ... }:
    {
      # nix run .#vm-kangaroo
      packages.vm-kangaroo = pkgs.writeShellApplication {
        name = "vm-kangaroo";
        text = ''
          ${inputs.self.nixosConfigurations.kangaroo.config.system.build.vm}/bin/run-kangaroo-vm "$@"
        '';
      };
    };
}
