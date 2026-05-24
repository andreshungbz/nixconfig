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
        nixpkgs.overlays = [ inputs.niri.overlays.niri ];
        environment.systemPackages = with pkgs; [ xwayland-satellite ]; # flake should automatically provide gnome-keyring

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };

        xdg = {
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

        # enable 3D acceleration
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
        imports = [
          (inputs.niri.homeModules.niri or { })
        ];

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;

          settings = {
            hotkey-overlay.skip-at-startup = true;
            prefer-no-csd = true;
            screenshot-path = "~/Pictures/Screenshots/screenshot-%Y-%m-%d %H-%M-%S.png";

            environment = {
              "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
              "NIXOS_OZONE_WL" = "1";
            };
          };
        };
      };
  };
}
