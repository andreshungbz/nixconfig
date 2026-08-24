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
