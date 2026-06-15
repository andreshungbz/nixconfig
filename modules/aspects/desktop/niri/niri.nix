{
  inputs,
  lib,
  __findFile,
  ...
}:
{
  # https://codeberg.org/BANanaD3V/niri-nix
  flake-file.inputs = {
    niri-nix.url = "git+https://codeberg.org/BANanaD3V/niri-nix";
  };

  # https://niri-wm.github.io/niri/index.html
  pkt.niri = {
    includes = [
      <pkt/niri-input>
      <pkt/niri-keybinds>
      <pkt/niri-keybinds-noctalia>
      <pkt/niri-layout>
      <pkt/niri-outputs>
      <pkt/niri-startup>
      <pkt/niri-window-rules>
    ];

    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.niri-nix.nixosModules.default ];

        # binary cache
        nix.settings = {
          substituters = [ "https://niri-nix.cachix.org" ];
          trusted-public-keys = [ "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0=" ];
        };

        # Niri package overlay
        # nixpkgs.overlays = [ inputs.niri-nix.overlays.niri-nix ];
        programs.niri = {
          enable = true;
          # package = pkgs.niri-unstable;
        };

        environment = {
          systemPackages = with pkgs; [ xwayland-satellite ];
          sessionVariables = {
            NIXOS_OZONE_WL = "1";
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
        imports = [ inputs.niri-nix.homeModules.default ];
        wayland.windowManager.niri.enable = true;

        # avoid warnings for VS Code due to the environment variables set above
        programs.fish.functions = {
          code = {
            body = "command code $argv 2>/dev/null";
          };
        };
      };
  };
}
