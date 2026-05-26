{
  # https://macos-defaults.com/
  pkt.cuprefs = {
    darwin = {
      system.defaults.CustomUserPreferences = {
        "com.apple.desktopservices" = {
          # disable .DS_Store files
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };

        # disable personalized advertising
        "com.apple.AdLib".allowApplePersonalizedAdvertising = false;

        # don't open Photos automatically when connecting a device
        "com.apple.ImageCapture".disableHotPlug = true;
      };
    };
  };
}
