{
  pkt.security = {
    nixos = {
      security = {
        rtkit.enable = true; # allows Pipewire to use the realtime scheduler for increased performance
      };
    };

    darwin = {
      security = {
        pam.services.sudo_local.touchIdAuth = true;
      };
    };
  };
}
