{
  lib,
  ...
}:
{
  # https://github.com/fastfetch-cli/fastfetch
  pkt.fastfetch = {
    homeManager.programs = {
      fastfetch = {
        enable = true;
        settings = builtins.fromJSON (builtins.readFile ./config.jsonc);
      };

      bash.shellAliases.ff = "fastfetch";
      zsh.shellAliases.ff = "fastfetch";
      fish.shellAliases.ff = "fastfetch";
    };
  };
}
