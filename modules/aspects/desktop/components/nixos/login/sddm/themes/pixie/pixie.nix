{ inputs, lib, ... }:
{
  # https://github.com/xCaptaiN09/pixie-sddm
  flake-file.inputs = {
    pixie-sddm.url = "github:xCaptaiN09/pixie-sddm";
    # pixie-sddm.url = "github:johnkferguson/pixie-sddm/fix/honor-config-keys"; # font fix branch
  };

  pkt.sddm-pixie = {
    nixos =
      { pkgs, ... }:
      {
        services.displayManager.sddm = {
          package = lib.mkForce pkgs.kdePackages.sddm;
          theme = "pixie";

          extraPackages = with pkgs; [
            kdePackages.qtsvg
            kdePackages.qtdeclarative
            kdePackages.qt5compat
          ];
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
