{
  inputs,
  ...
}:
{
  # https://noctalia.dev/luciole
  flake-file.inputs = {
    luciole.url = "github:noctalia-dev/luciole";
  };

  pkt.luciole = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.luciole.nixosModules.default ];

        programs.luciole.enable = true;
        services.gvfs.enable = true;
      };

    homeManager =
      { pkgs, ... }:
      {
        imports = [ inputs.luciole.homeModules.default ];

        programs.luciole = {
          enable = true;
          settings = {
            browser = {
              view_mode = "grid";
              show_hidden = false;
            };
          };
        };
      };
  };
}
