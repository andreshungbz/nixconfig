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

      darwin = {
        # TODO
      };
    };
}
