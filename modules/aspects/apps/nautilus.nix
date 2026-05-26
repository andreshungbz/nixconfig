{
  # https://apps.gnome.org/Nautilus/
  pkt.nautilus = {
    # https://wiki.nixos.org/wiki/Nautilus
    nixos =
      { pkgs, ... }:
      {
        nixpkgs.overlays = [
          (final: prev: {
            nautilus = prev.nautilus.overrideAttrs (nprev: {
              buildInputs =
                nprev.buildInputs
                ++ (with pkgs.gst_all_1; [
                  gst-plugins-good
                  gst-plugins-bad
                ]);
            });
          })
        ];

        environment = {
          pathsToLink = [ "share/thumbnailers" ];

          systemPackages = with pkgs; [
            libheif
            libheif.out
            nautilus
          ];
        };

        services = {
          gvfs.enable = true;
          udisks2.enable = true;
        };
      };
  };
}
