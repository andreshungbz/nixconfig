{ lib, ... }:
{
  # https://starship.rs/
  pkt.starship =
    args@{ ... }:
    let
      host = args.host or null;
      hostname = if host != null then host.name else "unknown";

      hostColors = {
        "hyena" = "#8a3838";
        "kangaroo" = "#38528a";
      };

      starshipBgColor =
        if builtins.hasAttr hostname hostColors then hostColors.${hostname} else "#327731";
    in
    {
      homeManager = {
        programs.starship = {
          enable = true;
          enableBashIntegration = true;
          enableZshIntegration = true;
          enableFishIntegration = true;

          # settings = builtins.fromTOML (builtins.readFile ./starship-v2.toml);

          settings = {
            add_newline = false;
            format = "$hostname$character";
            right_format = "[ $directory $git_branch](bg:${starshipBgColor} fg:fg_color)";

            palette = "packet";

            palettes.packet = {
              bg_color = "#38528a";
              fg_color = "#fdb00b";
              brand = "#4d6fb7";
            };

            character = {
              success_symbol = "[󰘧](fg:brand)";
              error_symbol = "[󰘧](fg:fg_color)";
              format = "$symbol ";
            };

            directory = {
              format = "$path";
              truncation_length = 1;
            };

            git_branch = {
              format = "\\[$branch\\] ";
            };

            hostname = {
              ssh_only = true;
              ssh_symbol = "󱘖";
              format = "[ $ssh_symbol $hostname ](bg:${starshipBgColor} fg:fg_color) ";
              trim_at = ".";
            };
          };
        };
      };
    };
}
