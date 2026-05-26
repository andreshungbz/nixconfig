{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  flake-file.inputs = {
    niri = {
      url = "github:sodiboo/niri-flake?shallow=true";
    };
  };

  # https://niri-wm.github.io/niri/index.html
  pkt.niri = {
    includes = [
      <pkt/niri-binds-columns>
      <pkt/niri-binds-media>
      <pkt/niri-binds-system>
      <pkt/niri-binds-utilities>
      <pkt/niri-binds-workspace>
      <pkt/niri-input>
      <pkt/niri-layout>
      <pkt/niri-outputs>
      <pkt/niri-spawn>
      <pkt/niri-window-rules>
    ];

    nixos =
      { pkgs, ... }:
      {
        # Niri package
        nixpkgs.overlays = [ inputs.niri.overlays.niri ];
        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };

        environment.systemPackages = with pkgs; [
          xwayland-satellite # for X11 apps (e.g., Steam, Discord)
        ];

        xdg = {
          # VM mkForce
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

        # VM 3D acceleration
        virtualisation.vmVariant = {
          virtualisation.qemu.options = [
            "-device"
            "virtio-vga-gl"
            "-display"
            "sdl,gl=on"
          ];
        };

        # binary cache
        nix.settings = {
          substituters = [ "https://niri.cachix.org" ];
          trusted-public-keys = [ "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964=" ];
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
            environment = {
              "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
              "NIXOS_OZONE_WL" = "1";
            };
          };
        };

        # avoid warnings for VS Code due to the environment variables set
        programs.fish.shellAliases = {
          code = "command code 2>/dev/null";
        };
      };
  };
}
