{ __findFile, ... }:
{
  pkt.dev-tools =
    { user }:
    {
      includes = [
        <pkt/devenv>
        <pkt/gpg>
        <pkt/wireshark>
      ];

      nixos =
        { pkgs, ... }:
        {
          users.users.${user.userName}.packages = with pkgs; [
            # cmdline
            cloc
            exiftool
            dnsmasq
            dnsutils
            ffmpeg
            jq
            ookla-speedtest
            powershell
            tldr
            tree
            wget

            #gui
            postman
            rpi-imager
            termius
            vscode
          ];
        };

      darwin = {
        # TODO
      };
    };
}
