{ inputs, lib, ... }:
{
  flake-file.inputs = {
    # https://github.com/xCaptaiN09/pixie-sddm
    pixie-sddm.url = "github:xCaptaiN09/pixie-sddm";

    # font fix branch
    # pixie-sddm.url = "github:johnkferguson/pixie-sddm/fix/honor-config-keys";
  };

  pkt.sddm = {
    nixos =
      { pkgs, ... }:
      {
        imports = [
          (inputs.pixie.sddm.nixosModules.default or { })
        ];

        services.displayManager.sddm = {
          enable = true;
          wayland.enable = true;

          package = lib.mkForce pkgs.kdePackages.sddm;

          extraPackages = with pkgs; [
            kdePackages.qtsvg
            kdePackages.qtdeclarative
            kdePackages.qt5compat
          ];

          theme = "pixie";
        };

        environment.systemPackages = [
          (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
            background = ./background.jpg;
            avatar = ./avatar.png;
            autoColor = true;
            use24HourClock = false;

            # waiting for font issues to be resolved
            # https://github.com/xCaptaiN09/pixie-sddm/pull/11
            # fontFamily = "JetBrains Mono";
            # fontSpacing = -70;
          })
        ];
      };
  };
}
