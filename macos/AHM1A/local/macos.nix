# Local MacOS Settings

{
  system = {
    defaults = {
      dock = {
        # dock customization
        persistent-apps = [
          { app = "/System/Applications/Mail.app"; }
          { app = "/System/Applications/Calendar.app"; }
          { app = "/System/Applications/Reminders.app"; }
          { app = "/System/Applications/Notes.app"; }
          { app = "/System/Applications/News.app"; }
          { app = "/System/Applications/Photos.app"; }
          { app = "/System/Applications/Books.app"; }
          { app = "/System/Applications/Music.app"; }
          { app = "/System/Applications/Messages.app"; }
          { app = "/Applications/WhatsApp.app"; }
          { app = "/Applications/Telegram.app"; }
          { app = "/Applications/Discord.app"; }
          { app = "/Applications/Firefox.app"; }
          { app = "/Applications/Microsoft Edge.app"; }
          { app = "/Applications/Visual Studio Code.app"; }
          { app = "/Applications/Obsidian.app"; }
          { app = "/Applications/Warp.app"; }
        ];
      };

      # lock screen
      loginwindow = {
        GuestEnabled = false;
        LoginwindowText = "andres.hung@outlook.com";
      };
    };
  };
}
