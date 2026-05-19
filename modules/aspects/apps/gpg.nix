{
  pkt.gpg = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          # https://gnupg.org/
          gnupg
        ];

        programs.gnupg = {
          agent = {
            enable = true;
            pinentryPackage = pkgs.pinentry-tty;
          };
        };
      };
  };
}
