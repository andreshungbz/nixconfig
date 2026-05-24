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
      <pkt/niri-binds-media>
      <pkt/niri-binds-monitor>
      <pkt/niri-binds-system>
      <pkt/niri-binds-utilities>
      <pkt/niri-binds-window>
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

        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };

        environment.systemPackages = with pkgs; [
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
            environment = {
              "NIXOS_OZONE_WL" = "1";
            };

            prefer-no-csd = true;
            hotkey-overlay.skip-at-startup = true;

            screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
          };
        };
      };
  };
}
