{
  # https://github.com/gmodena/nix-flatpak
  flake-file.inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
  };

  # https://flatpak.org/
  pkt.flatpak = {
    nixos = {
      services.flatpak = {
        enable = true;
        update.onActivation = true;
        remotes = [
          {
            name = "flathub";
            location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
          }
        ];
      };
    };
  };
}
