# Local NixOS Configuration Bundle

{
  imports = [
    ./boot.nix
    ./network.nix
    ./plasma.nix
  ];
}
