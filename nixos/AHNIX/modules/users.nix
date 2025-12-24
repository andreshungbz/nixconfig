# User Configuration

{ pkgs, user, ... }:
{
  users = {
    users = {
      ${user.username} = {
        description = user.name;
        isNormalUser = true;
        shell = pkgs.zsh;

        extraGroups = [
          "wheel"
          "networkmanager"
          "docker"
          "libvirtd"
          "openrazer"
          "wireshark"
        ];
      };
    };
  };
}
