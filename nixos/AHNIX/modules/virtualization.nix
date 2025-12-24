# Virtualization Configuration

{
  virtualisation = {
    # Docker, https://wiki.nixos.org/wiki/Docker/en
    docker.enable = true;

    # Multipass
    # virmultipass.enable = true;

    # Lib-virt, https://wiki.nixos.org/wiki/Libvirt
    # spiceUSBRedirection.enable = true;
    # libvirtd = {
    #   enable = true;
    #   qemu = {
    #     swtpm.enable = true;
    #   };
    # };
  };
}
