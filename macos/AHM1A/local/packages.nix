# Local Nix Packages, Homebrew Casks, and App Store Apps

{ pkgs, ... }:
{
  # nix packages
  packages = { inherit (pkgs) ookla-speedtest; };

  # homebrew casks
  casks = [
    # development tools
    "gpg-suite"
    "homebrew/cask/docker"
    "jetbrains-toolbox"
    "netspot"
    "powershell"
    "tailscale-app"
    "termius"
    "ti-connect-ce"
    "utm"
    "wireshark"

    # communication tools
    "discord"
    "zoom"

    # browsers
    "arc"
    "firefox"
    "zen"
    "google-chrome"
    "microsoft-edge"

    # applications
    "chatgpt"
    "google-drive"
    "iina"
    "krita"
    "microsoft-office"
    "obs"
    "obsidian"
    "protonvpn"
    "qbittorrent"
    "raycast"
    "rustdesk"
    "steam"
  ];

  # app store applications
  mas = {
    "Bitwarden" = 1352778147;
    "Affinity Designer 2" = 1616831348;
    "Affinity Photo 2: Image Editor" = 1616822987;
    "Affinity Publisher 2" = 1606941598;
    "Goodnotes 6: AI Notes & Docs" = 1444383602;
    "Pixelmator Pro" = 1289583905;
    # "Tailscale" = 1475387142;
    "Telegram" = 747648890;
    "WhatsApp Messenger" = 310633997;
  };
}
