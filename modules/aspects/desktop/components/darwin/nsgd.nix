{
  pkt.nsgd = {
    darwin = {
      system.defaults.NSGlobalDomain = {
        AppleShowAllExtensions = false; # file extensions
        AppleShowAllFiles = false; # hidden files
        AppleShowScrollBars = "Automatic";
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;

        "com.apple.keyboard.fnState" = false; # function keys
        "com.apple.mouse.tapBehavior" = 1; # tap to click
        "com.apple.sound.beep.feedback" = 0; # volume change beep
        "com.apple.sound.beep.volume" = 1.0; # volume change beep intensity
        "com.apple.swipescrolldirection" = true; # natural scrolling
      };
    };
  };
}
