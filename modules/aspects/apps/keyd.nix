{
  # https://github.com/rvaiya/keyd
  pkt.keyd = {
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
