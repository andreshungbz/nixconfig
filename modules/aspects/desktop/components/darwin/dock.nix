{
  pkt.dock = {
    darwin = {
      system.defaults.dock = {
        autohide = true;
        launchanim = true;
        orientation = "bottom";
        show-recents = false;
        tilesize = 48;

        # Hot Corners

        # 1: Disabled
        # 2: Mission Control
        # 3: Application Windows
        # 4: Desktop
        # 5: Start Screen Saver
        # 6: Disable Screen Saver
        # 7: Dashboard
        # 10: Put Display to Sleep
        # 11: Launchpad
        # 12: Notification Center
        # 13: Lock Screen
        # 14: Quick Note

        wvous-tl-corner = 13; # top left - Lock Screen
        wvous-tr-corner = 12; # top right - Notification Center
        wvous-bl-corner = 11; # bottom left - Launchpad
        wvous-br-corner = 4; # bottom right - Desktop
      };
    };
  };
}
