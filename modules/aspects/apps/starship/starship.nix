{ lib, ... }:
{
  # https://starship.rs/
  # adapted from https://github.com/antholeole/nixconfig
  pkt.starship = {
    homeManager.programs = {
      starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
        enableFishIntegration = true;

        # use toml file instead
        # settings = builtins.fromTOML (builtins.readFile ./starship.toml);

        settings = {
          format = "$character";
          right_format = "\$git_metrics $directory$hostname ";

          directory = {
            format = "[  ┃ $path ](bg:#8ab4f8 fg:#282a36)";
          };

          cmd_duration = {
            format = "[┃](bg:#8ab4f8 fg:#282a36)[$duration ](bg:#8ab4f8 fg:#282a36)";
          };

          hostname = {
            disabled = false;
            ssh_symbol = "󱘖 ";
            format = "[$ssh_symbol ](bg:#8ab4f8 fg:#282a36)";
          };

          character = {
            success_symbol = "[󰘧](fg:#8ab4f8)";
            error_symbol = "[󰘧](red)";
            format = "$symbol($style) ";
          };

          git_metrics = {
            disabled = false;
            only_nonzero_diffs = true;
            format = "[ +$added ](bg:#8ab4f8 fg:#282a36)[┃](bg:#8ab4f8 fg:#282a36)[ -$deleted ](bg:#8ab4f8 fg:#282a36)";
          };
        };
      };
    };
  };
}
