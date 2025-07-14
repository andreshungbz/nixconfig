# Font Configuration

{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
        ];
        serif = [
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
        ];
        monospace = [ "Noto Sans Mono CJK JP" ];
      };
    };
  };
}
