{ inputs, ... }:
{
  den.aspects.kangaroo-disko = {
    nixos = {
      imports = [ inputs.disko.nixosModules.disko ];

      disko.devices = {
        disk = {
          main = {
            type = "disk";
            device = "/dev/disk/by-id/nvme-WD_BLACK_SN850X_2000GB_23424M802412";
            content = {
              type = "gpt";
              partitions = {
                ESP = {
                  priority = 1;
                  name = "ESP";
                  size = "2G";
                  type = "EF00";
                  content = {
                    type = "filesystem";
                    format = "vfat";
                    mountpoint = "/boot";
                    mountOptions = [ "umask=0077" ];
                  };
                };
                root = {
                  size = "100%";
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ];
                    subvolumes = {
                      "@root" = {
                        mountpoint = "/";
                        mountOptions = [
                          "compress=zstd:1"
                          "discard=async"
                          "noatime"
                        ];
                      };
                      "@home" = {
                        mountpoint = "/home";
                        mountOptions = [
                          "compress=zstd:1"
                          "discard=async"
                          "noatime"
                        ];
                      };
                      "@nix" = {
                        mountpoint = "/nix";
                        mountOptions = [
                          "compress=zstd:1"
                          "discard=async"
                          "noatime"
                        ];
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
