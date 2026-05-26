{ __findFile, ... }:
{
  pkt.dev-tools =
    { user }:
    {
      includes = [
        <pkt/devenv>
        <pkt/gpg>
        <pkt/postgresql>
        <pkt/wireshark>
      ];

      nixos =
        { pkgs, ... }:
        {
          users.users.${user.userName}.packages = with pkgs; [
            # cmdline
            cloc
            exiftool
            distrobox
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

      darwin =
        { pkgs, ... }:
        {
          users.users.${user.userName}.packages = with pkgs; [
            # cmdline
            cloc
            exiftool
            dnsmasq
            dnsutils
            jq
            ookla-speedtest
            powershell
            tldr
            tree
            wget
          ];

          homebrew = {
            brews = [
              "telnet"
            ];

            casks = [
              "homebrew/cask/docker-desktop"
              "jetbrains-toolbox"
              "netspot"
              "postman"
              "postman-cli"
              "termius"
              "utm"
              "visual-studio-code"
              "warp"
            ];

            masApps = {

            };
          };
        };
    };
}
