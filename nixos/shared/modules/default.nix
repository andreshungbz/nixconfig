# Shared NixOS Configuration Bundle

{
  imports = [
    ./audio.nix
    ./avahi.nix
    ./bluetooth.nix
    ./international.nix
    ./print.nix
    ./ssh.nix
    ./timezone.nix
  ];
}
