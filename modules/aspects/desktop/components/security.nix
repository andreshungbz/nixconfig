{
  pkt.security = {
    nixos = {
      security = {
        rtkit.enable = true;
      };
    };

    darwin = {
      security = {
        pam.services.sudo_local.touchIdAuth = true;
      };
    };
  };
}
