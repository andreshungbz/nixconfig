{
  pkt.security = {
    nixos = {
      security = {
        rtkit.enable = true; # allows Pipewire to use the realtime scheduler for increased performance

        sudo.extraConfig = ''
          Defaults env_keep += "WAYLAND_DISPLAY QT_QPA_PLATFORM XDG_RUNTIME_DIR"
        '';
      };
    };

    darwin = {
      security = {
        pam.services.sudo_local.touchIdAuth = true;
      };
    };
  };
}
