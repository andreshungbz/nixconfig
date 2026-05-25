{ den, __findFile, ... }:
{
  # M1 MacBook Air
  den.hosts.aarch64-darwin.hyena = {
    users = {
      andreshung = {
        classes = [ "homeManager" ];
      };
    };
  };

  den.aspects.hyena = {
    includes = [

    ];

    provides.andreshung = {
      includes = [
        <pkt/darwin-base>
        <pkt/desktop-apps>
        <pkt/dev-tools>
        <pkt/gaming>
        <pkt/git>
        <pkt/homebrew>
        <pkt/kitty>
        <pkt/ssh>
        <pkt/terminal>
      ];

      darwin =
        { user }:
        {
          system.defaults.dock.persistent-apps = [
            { app = "/System/Applications/Mail.app"; }
            { app = "/System/Applications/Calendar.app"; }
            { app = "/System/Applications/Reminders.app"; }
            { app = "/System/Applications/Notes.app"; }
            { app = "/System/Applications/News.app"; }
            { app = "/System/Applications/Photos.app"; }
            # { app = "/Applications/Eagle.app"; }
            { app = "/System/Applications/Books.app"; }
            { app = "/System/Applications/Music.app"; }
            { app = "/System/Applications/Messages.app"; }
            { app = "/Applications/WhatsApp.app"; }
            { app = "/Applications/Telegram.app"; }
            { app = "/Applications/Discord.app"; }
            { app = "/Applications/Firefox.app"; }
            { app = "/Applications/Microsoft Edge.app"; }
            { app = "/Applications/Visual Studio Code.app"; }
            # { app = "/Applications/Obsidian.app"; }
            { app = "/Users/${user.userName}/Applications/Home Manager Apps/kitty.app"; }
          ];
        };
    };

    # Impromptu Configurations
    darwin =
      { pkgs, ... }:
      {
        environment = {
          systemPackages = with pkgs; [

          ];

          variables = rec {

          };
        };

        system.defaults = {
          SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
          loginwindow.LoginwindowText = "andres.hung@outlook.com";
        };

        homebrew = {
          brews = [

          ];

          casks = [

          ];

          masApps = {

          };
        };
      };
  };
}
