{ pkgs, ... }: {
  packages = { inherit (pkgs) nixfmt-classic; };

  casks = [
    # development tools
    "visual-studio-code"
    "warp"

    # browsers
    "firefox@developer-edition"

    # applications
    "alt-tab"
    "coconutbattery"
    "rectangle"
  ];

  mas = {
    "CopyClip - Clipboard History" = 595191960;
    "Hidden Bar" = 1452453066;
  };
}
