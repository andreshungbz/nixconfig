# Home Manager Programs

{
  lib,
  pkgs,
  ...
}:
{
  bat = {
    enable = true;
  };

  eza = {
    enable = true;
  };

  fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        padding = {
          top = 1;
          left = 2;
          right = 0;
        };
      };
      display = {
        separator = "| ";
      };
      modules = [
        "break"
        {
          type = "title";
          key = "           Identity ";
        }
        "break"
        {
          type = "host";
          key = "               Host ";
          format = "{2} ({4})";
        }
        {
          type = "cpu";
          key = "                CPU ";
        }
        {
          type = "gpu";
          key = "                GPU ";
        }
        {
          type = "memory";
          key = "             Memory ";
          format = "{used} / {total} ({percentage})";
          percent = {
            type = [
              "num"
            ];
          };
        }
        {
          type = "disk";
          key = "               Disk ";
          format = "{size-used} / {size-total} ({size-percentage}) - ({filesystem})";
          folders = "/";
          percent = {
            type = [
              "num"
            ];
          };
        }
        {
          type = "swap";
          key = "               Swap ";
          format = "{used} / {total} ({percentage})";
          percent = {
            type = [
              "num"
            ];
          };
        }
        {
          type = "monitor";
          key = "            Display ";
        }
        {
          type = "loadavg";
          key = "               Load ";
        }
        {
          type = "processes";
          key = "          Processes ";
        }
        "break"
        {
          type = "os";
          key = "   Operating System ";
        }
        {
          type = "kernel";
          key = "             Kernel ";
        }
        {
          type = "disk";
          key = "          Birthdate ";
          folders = "/";
          format = "{create-time:10} ({days} days)";
        }
        {
          type = "uptime";
          key = "             Uptime ";
        }
        {
          type = "packages";
          key = "           Packages ";
        }
        {
          type = "lm";
          key = "      Login Manager ";
          format = "{2}";
        }
        {
          type = "de";
          key = "Desktop Environment ";
        }
        {
          type = "wm";
          key = "     Window Manager ";
        }
        {
          type = "wmtheme";
          key = "           WM Theme ";
        }
        {
          type = "shell";
          key = "              Shell ";
        }
        {
          type = "terminal";
          key = "           Terminal ";
        }
        {
          type = "terminalfont";
          key = "      Terminal Font ";
          format = "{1}";
        }
        "break"
        {
          type = "player";
          key = "       Media Player ";
        }
        {
          type = "media";
          key = "            Playing ";
        }
        {
          type = "version";
          key = "               Info ";
          format = "{1} {2}";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 22;
          symbol = "";
        }
        "break"
        {
        }
      ];
    };
  };

  fzf = {
    enable = true;
  };

  # MacOS package marked broken
  # ghostty = {
  #   enable = true;
  #   settings = {
  #     font-size = 10;
  #   };
  # };
}
