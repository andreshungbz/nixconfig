{
  # https://sw.kovidgoyal.net/kitty/
  pkt.kitty =
    { user }:
    {
      homeManager =
        { pkgs, ... }:
        {
          programs = {
            kitty = {
              enable = true;

              shellIntegration = {
                enableBashIntegration = true;
                enableZshIntegration = true;
                enableFishIntegration = true;
              };

              font = {
                name = "JetBrainsMono Nerd Font";
                size = if pkgs.stdenv.isDarwin then 14 else 11;
              };

              settings = {
                background_opacity = 0.75;
                background_blur = 1;
                window_padding_width = 8;

                # workaround for https://github.com/nix-darwin/nix-darwin/issues/1237
                shell = "/etc/profiles/per-user/${user.userName}/bin/fish";
              };
            };
          };
        };
    };
}
