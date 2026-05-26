{
  # https://gnupg.org/
  pkt.gpg = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ gnupg ];

        programs.gnupg.agent = {
          enable = true;
          pinentryPackage = pkgs.pinentry-tty;
        };
      };
  };
}
