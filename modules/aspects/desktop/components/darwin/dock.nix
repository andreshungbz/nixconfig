{
  pkt.dock = {
    darwin = {
      system.defaults.dock = {
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
    };
  };
}
