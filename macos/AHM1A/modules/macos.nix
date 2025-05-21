# MacOS system settings

{ user, ... }:
let shared = import ../../shared/defaults.nix;
in {
  system = {
    primaryUser = user;
    stateVersion = 4;
    checks.verifyNixPath = false;

    startup.chime = false;
    defaults = shared // {
      # dock
      dock = {
        autohide = true;
        launchanim = true;
        orientation = "bottom";
        show-recents = false;
        tilesize = 48;

        # dock format
        persistent-apps = [
          { app = "/System/Applications/Mail.app"; }
          { app = "/System/Applications/Calendar.app"; }
          { app = "/System/Applications/Notes.app"; }
          { app = "/System/Applications/Reminders.app"; }
          { app = "/System/Applications/Photos.app"; }
          { app = "/System/Applications/Books.app"; }
          { app = "/System/Applications/Music.app"; }
          { app = "/System/Applications/Messages.app"; }
          { app = "/Applications/WhatsApp.app"; }
          { app = "/Applications/Telegram.app"; }
          { app = "/Applications/Discord.app"; }
          { app = "/Applications/Firefox.app"; }
          { app = "/Applications/Firefox Developer Edition.app"; }
          { app = "/Applications/Warp.app"; }
          { app = "/Applications/Visual Studio Code.app"; }
        ];

        # hot corners
        wvous-tl-corner = 13; # Lock Screen
        wvous-tr-corner = 12; # Notification Center
        wvous-bl-corner = 11; # Launchpad
        wvous-br-corner = 4; # Desktop
      };

      # lock screen
      loginwindow = {
        GuestEnabled = false;
        LoginwindowText = "andres.hung@outlook.com";
      };
    };

    activationScripts.restartDock = {
      text = ''
        echo "Restarting Dock to apply persistent apps changes..."
        killall Dock || true
      '';
    };
  };
}
