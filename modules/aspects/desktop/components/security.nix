{
  pkt.security = {
    nixos = {
      security = {
        rtkit.enable = true;
      };
    };

    dawrin = {
      security = {
        pam.services.sudo_local.touchIdAuth = true;
      };
    };
  };
}
