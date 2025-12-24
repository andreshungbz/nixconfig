# Program Configuration

{ pkgs, lib, ... }:
{
  programs = {
    # GPG
    gnupg = {
      agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-tty;
      };
    };

    # Nix-ld
    nix-ld.enable = true;

    # Steam, https://wiki.nixos.org/wiki/Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
    };

    # Virt-manager, https://wiki.nixos.org/wiki/Virt-manager
    # virt-manager.enable = true;

    # Wireshark
    wireshark = {
      enable = true;
      dumpcap.enable = true;
      usbmon.enable = true;
    };
  };
}
