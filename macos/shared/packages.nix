{ pkgs }: {
  packages = { inherit (pkgs) nixfmt-classic; };

  casks = [
    # # development tools
    # "homebrew/cask/docker"
    # "jetbrains-toolbox"
    # "netspot"
    # "powershell"
    # "utm"
    "visual-studio-code"
    "warp"
    # "wireshark"

    # # communication tools
    # "discord"
    # "zoom"

    # # browsers
    # "arc"
    # "firefox"
    "firefox@developer-edition"
    # "google-chrome"
    # "microsoft-edge"

    # # applications
    # "alt-tab"
    # "coconutbattery"
    # "google-drive"
    # "iina"
    # "microsoft-office"
    # "obs"
    # "obsidian"
    # "protonvpn"
    # "qbittorrent"
    # "rectangle"
    # "steam"
  ];

  mas = {
    # "Affinity Designer 2" = 1616831348;
    # "Affinity Photo 2: Image Editor" = 1616822987;
    # "Affinity Publisher 2" = 1606941598;
    # "Bitwarden" = 1352778147;
    # "CopyClip - Clipboard History" = 595191960;
    # "Goodnotes 6: AI Notes & Docs" = 1444383602;
    # "Hidden Bar" = 1452453066;
    # "Pixelmator Pro" = 1289583905;
    "Telegram" = 747648890;
    # "WhatsApp Messenger" = 310633997;
  };
}
