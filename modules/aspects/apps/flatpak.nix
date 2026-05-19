{
  flake-file.inputs = {
    # https://github.com/gmodena/nix-flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
  };

  pkt.flatpak = {
    nixos = {
      services.flatpak = {
        enable = true;
        update.onActivation = true;
      };
    };
  };
}
