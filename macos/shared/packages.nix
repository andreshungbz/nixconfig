# Shared Nix Packages, Homebrew Casks, and App Store Apps

{ pkgs, ... }:
{
  # nix packages
  packages = { inherit (pkgs) fastfetch nixfmt-rfc-style; };

  # homebrew casks
  casks = [
    # development tools
    "visual-studio-code"
    "warp"

    # browsers
    "firefox@developer-edition"

    # other
    "alt-tab"
    "rectangle"
    "stats"
  ];

  # app store applications
  mas = {
    "CopyClip - Clipboard History" = 595191960;
    "Hidden Bar" = 1452453066;
  };
}
