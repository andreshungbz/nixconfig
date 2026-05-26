{
  pkt.font = {
    # https://wiki.nixos.org/wiki/Fonts
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          enableDefaultPackages = true;

          packages = with pkgs; [
            corefonts
            jetbrains-mono
            nerd-fonts.commit-mono
            nerd-fonts.jetbrains-mono
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
          ];

          fontconfig = {
            enable = true;

            defaultFonts = {
              monospace = [
                "Noto Sans Mono CJK JP"
              ];

              sansSerif = [
                "Noto Sans CJK JP"
                "Noto Sans CJK KR"
              ];

              serif = [
                "Noto Serif CJK JP"
                "Noto Serif CJK KR"
              ];
            };
          };
        };
      };

    darwin =
      { pkgs, ... }:
      {
        fonts.packages = with pkgs; [
          nerd-fonts.commit-mono
          nerd-fonts.jetbrains-mono
        ];
      };
  };
}
