{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    nerd-fonts.commit-mono
    nerd-fonts.jetbrains-mono
  ];
}
