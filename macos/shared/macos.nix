# Shared MacOS Settings

{ user, ... }: {
  # sudo authentication with TouchID
  security = { pam.services.sudo_local.touchIdAuth = true; };

  system = {
    primaryUser = user.username;
    checks.verifyNixPath = false;
    startup.chime = false;

    defaults = {
      # automatic updates
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

      # global defaults
      NSGlobalDomain = {
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

      # custom preferences (unavailable in nix-darwin)
      # https://macos-defaults.com/
      CustomUserPreferences = {
        # disable .DS_Store files
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        # advertising
        "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };

        # don't open Photos automatically when connecting a device
        "com.apple.ImageCapture".disableHotPlug = true;
      };

      # control center
      controlcenter = { BatteryShowPercentage = true; };

      # dock
      dock = {
        autohide = true;
        launchanim = true;
        orientation = "bottom";
        show-recents = false;
        tilesize = 48;

        # hot corners
        wvous-tl-corner = 13; # Lock Screen
        wvous-tr-corner = 12; # Notification Center
        wvous-bl-corner = 11; # Launchpad
        wvous-br-corner = 4; # Desktop
      };

      # finder
      finder = {
        _FXShowPosixPathInTitle = true;
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      # trackpad
      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
      };

      # screenshot
      screencapture = {
        disable-shadow = true;
        target = "clipboard";
        type = "png";
      };
    };
  };
}
