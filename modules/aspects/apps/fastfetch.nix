{
  # https://github.com/fastfetch-cli/fastfetch
  pkt.fastfetch = {
    homeManager.programs = {
      fastfetch = {
        enable = true;
        settings = {
          "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";

          # Logo
          logo = {
            type = "small";
            padding = {
              top = 1;
              left = 2;
              right = 0;
            };
          };

          # Display
          display = {
            separator = " | ";
          };

          # Modules
          modules = [
            # Top Section
            "break"
            {
              type = "title";
              key = "            Identity";
            }
            {
              type = "disk";
              key = "          System Age";
              folders = "/";
              format = "{days} days ({create-time:10})";
            }
            {
              type = "uptime";
              key = "              Uptime";
            }
            {
              type = "player";
              key = "        Media Player";
            }
            {
              type = "media";
              key = "             Playing";
            }

            # Section 1
            "break"
            {
              type = "os";
              key = "    Operating System";
            }
            {
              type = "kernel";
              key = "              Kernel";
            }
            {
              type = "lm";
              key = "       Login Manager";
              format = "{2}";
            }
            {
              type = "de";
              key = "Desktop Environment";
            }
            {
              type = "wm";
              key = "      Window Manager";
            }
            {
              type = "shell";
              key = "               Shell";
            }
            {
              type = "terminal";
              key = "            Terminal";
            }

            # Section 2
            "break"
            {
              type = "host";
              key = "                Host";
              format = "{2} ({4})";
            }
            {
              type = "cpu";
              key = "                 CPU";
            }

            {
              type = "gpu";
              key = "                 GPU";
            }
            {
              type = "memory";
              key = "              Memory";
              format = "{used} / {total} ({percentage})";
              percent = {
                type = [ "num" ];
              };
            }
            {
              type = "disk";
              key = "                Disk";
              format = "{size-used} / {size-total} ({size-percentage}) - ({filesystem})";
              folders = "/";
              percent = {
                type = [ "num" ];
              };
            }
            "break"
          ];
        };
      };

      bash.shellAliases = {
        ff = "fastfetch";
      };

      zsh.shellAliases = {
        ff = "fastfetch";
      };

      fish.shellAliases = {
        ff = "fastfetch";
      };
    };
  };
}
