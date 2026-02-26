# Homebrew Configuration

{ pkgs, ... }:
let
  shared = import ../../shared/homebrew.nix { inherit pkgs; };
in
{
  homebrew = {
    enable = true;

    brews = shared.brews ++ [
      "golang-migrate"
      "hey"
      "postgresql@18"
      "python@3.14"
      "telnet"
    ];

    casks = shared.casks ++ [
      # development tools
      "gpg-suite"
      "homebrew/cask/docker-desktop"
      "jetbrains-toolbox"
      "netspot"
      "pgadmin4"
      "powershell"
      "tailscale-app"
      "termius"
      "ti-connect-ce"
      "utm"
      "visual-studio-code"
      "warp"
      "wireshark-app"

      # communication tools
      "discord"
      "zoom"

      # browsers
      "arc"
      "firefox"
      "firefox@developer-edition"
      "zen"
      "google-chrome"
      "microsoft-edge"

      # applications
      "chatgpt"
      "google-drive"
      "iina"
      "krita"
      "mediamate"
      "microsoft-office"
      "obs"
      "obsidian"
      "protonvpn"
      "qbittorrent"
      "raycast"
      "rustdesk"
      "steam"
    ];

    masApps = shared.mas // {
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
  };
}
