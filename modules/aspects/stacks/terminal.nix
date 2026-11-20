{ __findFile, ... }:
{
  pkt.terminal = {
    includes = [
      <pkt/bat>
      <pkt/btop>
      <pkt/eza>
      <pkt/fastfetch>
      <pkt/fish>
      <pkt/helix>
      <pkt/starship>
      <pkt/zellij>
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fd
          fzf
          timg
          unrar
        ];
      };

    darwin = {
      homebrew = {
        brews = [

        ];

        casks = [

        ];

        masApps = {

        };
      };
    };
  };
}
