{
  # https://macos-defaults.com/
  pkt.cuprefs = {
    darwin = {
      system.defaults.CustomUserPreferences = {
        # disable .DS_Store files
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        # advertising
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };

        # don't open Photos automatically when connecting a device
        "com.apple.ImageCapture".disableHotPlug = true;
      };
    };
  };
}
