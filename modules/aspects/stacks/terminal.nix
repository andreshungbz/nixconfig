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
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fd
          fzf
        ];
      };
  };
}
