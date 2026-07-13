{ __findFile, ... }:
{
  pkt.desktop-apps = {
    includes = [
      <pkt/bitwarden>
      <pkt/davinci-resolve>
      <pkt/flatpak>
      <pkt/kitty>
      <pkt/nautilus>
      <pkt/openrazer>
      <pkt/proton>
      <pkt/sunshine>
      <pkt/tailscale>
    ];

    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [
          # https://apps.gnome.org/
          baobab
          eyedropper
          gnome-calculator
          gnome-characters
          gnome-disk-utility
          gnome-font-viewer
          gnome-logs
          gnome-text-editor
          impression
          loupe
          papers

          discord
          discord-canary
          discord-ptb
          element-desktop
          cider-2
          firefox
          microsoft-edge
          obsidian
          obs-studio
          onlyoffice-desktopeditors
          qbittorrent
          signal-desktop
          telegram-desktop
          thunderbird
          veracrypt
          vesktop
          vlc
          zoom-us
        ];
      };

    darwin = {
      homebrew = {
        casks = [
          "alt-tab"
          "discord"
          "element"
          "firefox"
          "google-drive"
          "iina"
          "microsoft-edge"
          "obs"
          "obsidian"
          "qbittorrent"
          "raycast"
          "stats"
          "ti-connect-ce"
          "veracrypt"
          "zoom"
        ];

        masApps = {
          # "Affinity Designer 2" = 1616831348;
          # "Affinity Photo 2: Image Editor" = 1616822987;
          # "Affinity Publisher 2" = 1606941598;
          "Goodnotes 6: AI Notes & Docs" = 1444383602;
          "Hidden Bar" = 1452453066;
          "Pixelmator Pro" = 1289583905;
          "Telegram" = 747648890;
          "WhatsApp Messenger" = 310633997;
        };
      };
    };
  };
}
