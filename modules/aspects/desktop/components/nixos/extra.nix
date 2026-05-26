{
  pkt.extra = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          cryptsetup
          exfatprogs
          ffmpegthumbnailer
          wl-clipboard
        ];
      };
  };
}
