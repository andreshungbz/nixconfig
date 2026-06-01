{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  # https://github.com/sodiboo/niri-flake
  flake-file.inputs = {
    niri.url = "github:sodiboo/niri-flake?shallow=true";
  };

  # https://niri-wm.github.io/niri/index.html
  pkt.niri = {
    includes = [
      <pkt/niri-input>
      <pkt/niri-keybinds>
      <pkt/niri-layout>
      <pkt/niri-outputs>
      <pkt/niri-startup>
      <pkt/niri-window-rules>
    ];

    nixos =
      { pkgs, ... }:
      {
        # binary cache
        nix.settings = {
          substituters = [ "https://niri.cachix.org" ];
          trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
        };

        # Niri package overlay
        nixpkgs.overlays = [ inputs.niri.overlays.niri ];
        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };

        environment.systemPackages = with pkgs; [
          xwayland-satellite # for X11 apps (e.g., Steam, Discord)
          # gnome-keyring already provided by sodiboo flake
        ];

        xdg = {
          # mkForce for VM testing
          autostart.enable = lib.mkForce true;
          icons.enable = lib.mkForce true;
          mime.enable = lib.mkForce true;

          portal = {
            enable = true;
            extraPortals = with pkgs; [
              xdg-desktop-portal-gnome # screencasting support
              xdg-desktop-portal-gtk # fallback portal
            ];
          };
        };

        # enable 3D acceleration in VM testing
        virtualisation.vmVariant = {
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
        imports = [ inputs.niri.homeModules.niri ];

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;

          settings = {
            environment = {
              # https://niri-wm.github.io/niri/Application-Issues.html#electron-applications
              "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
              "NIXOS_OZONE_WL" = "1";
            };
          };
        };

        # avoid warnings for VS Code due to the environment variables set above
        programs.fish.shellAliases.code = "command code 2>/dev/null";
      };
  };
}
