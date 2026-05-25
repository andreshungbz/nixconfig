{ __findFile, ... }:
{
  pkt.desktop-apps =
    { user }:
    {
      includes = [
        <pkt/bitwarden>
        <pkt/flatpak>
        <pkt/openrazer>
        <pkt/tailscale>
      ];

      nixos =
        { pkgs, ... }:
        {
          users.users.${user.userName}.packages = with pkgs; [
            # GNOME Apps
            baobab
            eyedropper
            gnome-calculator
            gnome-characters
            gnome-disk-utility
            gnome-font-viewer
            gnome-logs
            impression
            loupe
            papers
            snapshot

            discord
            cider-2
            firefox
            onlyoffice-desktopeditors
            microsoft-edge
            obsidian
            obs-studio
            qbittorrent
            signal-desktop
            telegram-desktop
            thunderbird
            vlc
            veracrypt
            zoom-us
          ];
        };

      darwin =
        { pkgs, ... }:
        {
          homebrew = {
            casks = [
              "alt-tab"
              "discord"
              "firefox"
              "google-drive"
              "iina"
              "microsoft-edge"
              "microsoft-office"
              "obs"
              "obsidian"
              "protonvpn"
              "qbittorrent"
              "raycast"
              "stats"
              "ti-connect-ce"
              "zoom"
            ];

            masApps = {
              "Affinity Designer 2" = 1616831348;
              "Affinity Photo 2: Image Editor" = 1616822987;
              "Affinity Publisher 2" = 1606941598;
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
