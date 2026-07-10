{
  # https://github.com/rvaiya/keyd
  pkt.keyd = {
    # https://wiki.nixos.org/wiki/Keyd
    nixos = {
      services.keyd = {
        enable = true;
        keyboards = {
          default = {
            ids = [ "*" ];
            settings = {
              meta = {
                # Mod + . to Escape
                "." = "esc";
              };
            };
          };
        };
      };
    };
  };
}
