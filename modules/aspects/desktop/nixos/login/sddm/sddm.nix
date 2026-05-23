{ __findFile, ... }:
{
  pkt.sddm = {
    includes = [
      <pkt/sddm-pixie>
    ];

    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          kdePackages.breeze
        ];

        services.displayManager.sddm = {
          enable = true;
          wayland.enable = true;

          settings = {
            Theme = {
              CursorTheme = "Breeze_Light";
            };
          };
        };
      };
  };
}
