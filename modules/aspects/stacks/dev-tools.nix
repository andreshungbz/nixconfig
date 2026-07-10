{ __findFile, ... }:
{
  pkt.dev-tools = {
    includes = [
      <pkt/devenv>
      <pkt/docker>
      <pkt/git>
      <pkt/gpg>
      <pkt/keyd>
      <pkt/postgresql>
      <pkt/wireshark>
    ];

    nixos =
      { pkgs, user, ... }:
      {
        users.users.${user.userName}.packages = with pkgs; [
          # cmdline
          cloc
          exiftool
          distrobox
          dnsmasq
          dnsutils
          ffmpeg
          github-cli
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
          zed-editor
        ];
      };

    darwin =
      { pkgs, user, ... }:
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
            "gh"
            "telnet"
          ];

          casks = [
            "jetbrains-toolbox"
            "netspot"
            "postman"
            "postman-cli"
            "termius"
            "utm"
            "visual-studio-code"
            "warp"
            "zed"
          ];

          masApps = {
            "Termix" = 6752672071;
          };
        };
      };
  };
}
