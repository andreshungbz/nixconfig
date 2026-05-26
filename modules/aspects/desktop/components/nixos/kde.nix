{
  # https://kde.org/
  pkt.kde = {
    nixos =
      { pkgs, ... }:
      {
        services.desktopManager.plasma6.enable = true;
        programs.kdeconnect.enable = true;

        environment = {
          systemPackages = with pkgs; [
            kdePackages.filelight
            kdePackages.kcalc
            kdePackages.kcharselect
            kdePackages.kcolorchooser
            kdePackages.khelpcenter
            kdePackages.kjournald
            kdePackages.kleopatra
            kdePackages.isoimagewriter
            kdePackages.partitionmanager
            kdePackages.sddm-kcm
          ];

          variables.POWERDEVIL_NO_DDCUTIL = "1"; # disable auto brightness adjustment
        };
      };
  };
}
