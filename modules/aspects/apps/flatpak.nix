{
  flake-file.inputs = {
    # https://github.com/gmodena/nix-flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
  };

  # https://flatpak.org/
  pkt.flatpak = {
    nixos = {
      services.flatpak = {
        enable = true;
        update.onActivation = true;
      };
    };
  };
}
