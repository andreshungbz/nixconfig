{ lib, ... }:
{
  # https://starship.rs/
  pkt.starship = {
    homeManager.programs = {
      starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        settings = builtins.fromTOML (builtins.readFile ./starship-v2.toml);
      };
    };
  };
}
