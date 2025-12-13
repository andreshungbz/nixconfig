{
  lib,
  pkgs,
  user,
  ...
}:

{
  home.username = user.username;
  home.homeDirectory = "/home/${user.username}";
  home.stateVersion = "25.05";

  # ----------------------
  # Core programs
  # ----------------------

  programs.git = {
    enable = true;
    userName = user.name;
    userEmail = user.email;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 2000;
      save = 2000;
    };

    shellAliases = {
      ls = "eza --color=always --icons=always";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];

    initExtra = ''
      eval "$(starship init zsh)"
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';
  };

  programs.starship.enable = true;

  # ----------------------
  # User packages
  # ----------------------

  home.packages = with pkgs; [
    eza
    fzf
    bat
  ];

  # FastFetch

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
}
