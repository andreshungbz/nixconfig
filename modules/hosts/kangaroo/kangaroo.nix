{
  den,
  lib,
  __findFile,
  ...
}:
{
  # ASUS AMD Gaming Desktop
  den.hosts.x86_64-linux.kangaroo = {
    users.packet.classes = [ "homeManager" ];
  };

  den.aspects.kangaroo = {
    includes = [
      den.aspects.kangaroo-computer
      den.aspects.kangaroo-disko
    ];

    provides.packet = {
      includes = [
        <pkt/desktop-apps>
        <pkt/dev-tools>
        <pkt/gaming>
        <pkt/niri>
        <pkt/nixos-base>
        <pkt/noctalia>
        <pkt/noctalia-greeter>
        <pkt/terminal>
      ];

      homeManager = {
        # useful for setting an icon when testing, but probably conflicts in real setups.
        # home.file.".face.icon".source = ./avatar.png;

        # explicitly set home.pointerCursor.enable
        home.pointerCursor.enable = true;
      };
    };

    # Impromptu Configurations
    nixos =
      { pkgs, lib, ... }:
      {
        users.users.root.initialHashedPassword = lib.mkForce "$2b$05$8XN4POkJCMRkxqd//Vw0VuQWdeM9oL5vBr8qMcXcfS7mQeZrXmRCG";

        environment = {
          systemPackages = with pkgs; [

          ];

          variables = {
            POWERDEVIL_NO_DDCUTIL = "1";
          };
        };

        nixpkgs.config.permittedInsecurePackages = [
          # "electron-39.8.10"
          # "electron-40.10.5"
          # "pnpm-10.29.2"
        ];

        # Startup applications
        systemd.user.services.startup-network-apps = {
          description = "Launch GUI apps after network is online";

          after = [
            "graphical-session.target"
            "network-online.target"
          ];
          wants = [ "network-online.target" ];
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "niri.service" ];

          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
            ExecStart = pkgs.writeShellScript "launch-apps" ''
              /run/current-system/sw/bin/systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

              count=0
              while ! /run/current-system/sw/bin/ping -c 1 -W 1 1.1.1.1 >/dev/null 2>&1; do
                sleep 1
                count=$((count + 1))
                if [ $count -ge 30 ]; then
                  echo "Network offline or timed out. Aborting startup apps."
                  exit 1
                fi
              done

              /etc/profiles/per-user/packet/bin/Telegram &
              /etc/profiles/per-user/packet/bin/discord &
              /etc/profiles/per-user/packet/bin/discordptb &
              /etc/profiles/per-user/packet/bin/discordcanary &
              /etc/profiles/per-user/packet/bin/element-desktop &
              /etc/profiles/per-user/packet/bin/signal-desktop &
              /etc/profiles/per-user/packet/bin/cider-2 &
              /run/current-system/sw/bin/steam &
              /etc/profiles/per-user/packet/bin/thunderbird &
            '';
          };
        };
      };
  };
}
