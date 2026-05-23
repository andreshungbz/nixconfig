{ inputs, lib, ... }:
{
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake?shallow=true";
    };
  };

  pkt.niri = {
    nixos =
      { pkgs, ... }:
      {
        nixpkgs.overlays = [ inputs.niri.overlays.niri ];

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };

        environment.systemPackages = with pkgs; [
          playerctl
          xwayland-satellite
        ];

        xdg = {
          autostart.enable = lib.mkForce true;
          icons.enable = lib.mkForce true;
          mime.enable = lib.mkForce true;

          portal = {
            enable = true;
            extraPortals = with pkgs; [
              xdg-desktop-portal-gnome
              xdg-desktop-portal-gtk
            ];
          };
        };

        virtualisation.vmVariant = {
          # enable 3D acceleration
          virtualisation.qemu.options = [
            "-device"
            "virtio-vga-gl"
            "-display"
            "sdl,gl=on"
          ];
        };
      };

    homeManager =
      { pkgs, ... }:
      {
        imports = [
          (inputs.niri.homeModules.niri or { })
        ];

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;

          settings = {
            spawn-at-startup = [
              {
                command = [
                  "noctalia"
                ];
              }
              {
                command = [
                  "Telegram"
                ];
              }
              {
                command = [
                  "discord"
                ];
              }
            ];

            environment = {
              "NIXOS_OZONE_WL" = "1";
            };

            prefer-no-csd = true;
            hotkey-overlay.skip-at-startup = true;

            screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

            outputs = {
              "Virtual-1" = {
                mode = {
                  width = 1920;
                  height = 1080;
                };
                scale = 1.0;
              };

              "DP-1" = {
                mode = {
                  width = 2560;
                  height = 1440;
                  refresh = 143.973;
                };
                scale = 1.25;
                position = {
                  x = 0;
                  y = 0;
                };
              };

              "DP-2" = {
                mode = {
                  width = 2560;
                  height = 1440;
                  refresh = 179.952;
                };
                scale = 1.25;

                transform = {
                  rotation = 90;
                  flipped = false;
                };

                position = {
                  x = -1152;
                  y = -775;
                };
              };
            };

            input = {
              keyboard = {
                xkb.layout = "us";
                numlock = true;
              };

              mouse = {
                accel-speed = -0.6;
              };

              focus-follows-mouse = {
                enable = true;
                max-scroll-amount = "5%";
              };

              touchpad = {
                click-method = "button-areas";
                dwt = true;
                natural-scroll = true;
                tap = true;
              };

              trackpoint = {
                natural-scroll = false;
              };
            };

            layout = {
              background-color = "transparent";
              gaps = 10;

              center-focused-column = "never";

              default-column-width = {
                proportion = 0.5;
              };

              preset-column-widths = [
                { proportion = 0.33333; }
                { proportion = 0.5; }
                { proportion = 0.66667; }
                { proportion = 1.0; }
              ];

              focus-ring = {
                enable = true;
                width = 2;
                active.color = "#A8AEFF";
                inactive.color = "#505050";
              };

              shadow = {
                enable = true;
                softness = 30;
                spread = 5;
                offset = {
                  x = 0;
                  y = 5;
                };
                color = "#0007";
              };
            };

            workspaces = {
              "comms" = {
                open-on-output = "DP-2";
              };
            };

            window-rules = [
              {
                matches = [ { app-id = "^discord$"; } ];
                open-on-workspace = "comms";
                default-column-display = "normal";
                default-column-width = {
                  proportion = 1.0;
                };
                default-window-height = {
                  proportion = 0.5;
                };
              }

              {
                matches = [ { app-id = "^org.telegram.desktop$"; } ];
                open-on-workspace = "comms";
                default-column-display = "normal";
                default-column-width = {
                  proportion = 1.0;
                };
                default-window-height = {
                  proportion = 0.5;
                };
              }

              {
                matches = [
                  {
                    app-id = "firefox$";
                    title = "^Picture-in-Picture$";
                  }
                ];
                open-floating = true;
              }
            ];

            binds = {
              # Shortcuts / System Binds

              "Mod+Shift+Slash".action.show-hotkey-overlay = [ ];
              "Ctrl+Alt+Delete".action.quit = [ ];

              "Mod+T".action.spawn = "kitty";
              "Mod+E".action.spawn = [
                "nautilus"
                "--new-window"
              ];
              "Alt+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
              "Mod+L".action.spawn-sh = "noctalia msg screen-lock";

              # Media / Audio Control

              "XF86AudioRaiseVolume" = {
                allow-when-locked = true;
                action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+ -l 1.0";
              };
              "XF86AudioLowerVolume" = {
                allow-when-locked = true;
                action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
              };
              "XF86AudioMute" = {
                allow-when-locked = true;
                action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              };
              "XF86AudioMicMute" = {
                allow-when-locked = true;
                action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
              };
              "XF86AudioPlay" = {
                allow-when-locked = true;
                action.spawn-sh = "playerctl play-pause";
              };
              "XF86AudioPause" = {
                allow-when-locked = true;
                action.spawn-sh = "playerctl play-pause";
              };
              "XF86AudioStop" = {
                allow-when-locked = true;
                action.spawn-sh = "playerctl stop";
              };
              "XF86AudioPrev" = {
                allow-when-locked = true;
                action.spawn-sh = "playerctl previous";
              };
              "XF86AudioNext" = {
                allow-when-locked = true;
                action.spawn-sh = "playerctl next";
              };

              # Layout / Workspaces / Window Management

              "Mod+O" = {
                repeat = false;
                action.toggle-overview = [ ];
              };
              "Mod+Q".action.close-window = [ ];

              "Mod+Left".action.focus-column-left = [ ];
              "Mod+Right".action.focus-column-right = [ ];
              "Mod+Down".action.focus-window-down = [ ];
              "Mod+Up".action.focus-window-up = [ ];

              "Mod+Ctrl+Left".action.move-column-left = [ ];
              "Mod+Ctrl+Right".action.move-column-right = [ ];
              "Mod+Ctrl+Down".action.move-window-down = [ ];
              "Mod+Ctrl+Up".action.move-window-up = [ ];

              "Mod+Home".action.focus-column-first = [ ];
              "Mod+End".action.focus-column-last = [ ];
              "Mod+Ctrl+Home".action.move-column-to-first = [ ];
              "Mod+Ctrl+End".action.move-column-to-last = [ ];

              # Monitor Management

              "Mod+Shift+Left".action.focus-monitor-left = [ ];
              "Mod+Shift+Right".action.focus-monitor-right = [ ];

              "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [ ];
              "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [ ];

              # Workspace Switching

              "Mod+Page_Down".action.focus-workspace-down = [ ];
              "Mod+Page_Up".action.focus-workspace-up = [ ];
              "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = [ ];
              "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = [ ];
              "Mod+Shift+Page_Down".action.move-workspace-down = [ ];
              "Mod+Shift+Page_Up".action.move-workspace-up = [ ];

              "Mod+WheelScrollDown" = {
                cooldown-ms = 150;
                action.focus-column-right = [ ];

              };
              "Mod+WheelScrollUp" = {
                cooldown-ms = 150;
                action.focus-column-left = [ ];

              };
              "Mod+Ctrl+WheelScrollDown" = {
                cooldown-ms = 150;
                action.focus-workspace-down = [ ];
              };
              "Mod+Ctrl+WheelScrollUp" = {
                cooldown-ms = 150;
                action.focus-workspace-up = [ ];
              };

              "Mod+1".action.focus-workspace = 1;
              "Mod+2".action.focus-workspace = 2;
              "Mod+3".action.focus-workspace = 3;
              "Mod+4".action.focus-workspace = 4;
              "Mod+5".action.focus-workspace = 5;
              "Mod+6".action.focus-workspace = 6;
              "Mod+7".action.focus-workspace = 7;
              "Mod+8".action.focus-workspace = 8;
              "Mod+9".action.focus-workspace = 9;

              "Mod+Ctrl+1".action.move-column-to-workspace = 1;
              "Mod+Ctrl+2".action.move-column-to-workspace = 2;
              "Mod+Ctrl+3".action.move-column-to-workspace = 3;
              "Mod+Ctrl+4".action.move-column-to-workspace = 4;
              "Mod+Ctrl+5".action.move-column-to-workspace = 5;
              "Mod+Ctrl+6".action.move-column-to-workspace = 6;
              "Mod+Ctrl+7".action.move-column-to-workspace = 7;
              "Mod+Ctrl+8".action.move-column-to-workspace = 8;
              "Mod+Ctrl+9".action.move-column-to-workspace = 9;

              # Column Operations

              "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
              "Mod+BracketRight".action.consume-or-expel-window-right = [ ];
              "Mod+Comma".action.consume-window-into-column = [ ];
              "Mod+Period".action.expel-window-from-column = [ ];
              "Mod+R".action.switch-preset-column-width = [ ];
              "Mod+Shift+R".action.switch-preset-column-width-back = [ ];
              "Mod+Ctrl+Shift+R".action.switch-preset-window-height = [ ];
              "Mod+F".action.maximize-column = [ ];
              "Mod+Shift+F".action.fullscreen-window = [ ];
              "Mod+C".action.center-column = [ ];
              "Mod+Ctrl+C".action.center-visible-columns = [ ];
              "Mod+Minus".action.set-column-width = "-10%";
              "Mod+Equal".action.set-column-width = "+10%";
              "Mod+Shift+Minus".action.set-window-height = "-10%";
              "Mod+Shift+Equal".action.set-window-height = "+10%";

              # Floating Layout Elements

              "Mod+V".action.toggle-window-floating = [ ];
              "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [ ];
              "Mod+W".action.toggle-column-tabbed-display = [ ];

              # Utilities

              "Print".action.screenshot = [ ];
              "Ctrl+Print".action.screenshot-screen = [ ];
              "Alt+Print".action.screenshot-window = [ ];
              "Mod+Shift+P".action.power-off-monitors = [ ];
            };
          };
        };
      };
  };
}
