# Nix Configuration

This repository contains my fully refactored Nix configurations using the aspect-oriented [Den](https://den.denful.dev/) Nix framework to implement the Dendritic pattern. Aspects are defined in the `modules/aspects` directory and are composed in `modules/aspects/stacks`. These are included in the various home and host configurations, defined in `modules/homes` and `modules/hosts`, respectively. The `modules/dotfiles` directory contains miscellaneous configuration files that are not integrated with Nix.

## Showcase

### `kangaroo`

[NixOS](https://nixos.org/) AMD gaming desktop running [Niri](https://github.com/niri-wm/niri) and [Noctalia](https://noctalia.dev/) v5, testable with the `nix run .#vm-kangaroo` command.

[TODO: screenshot]

### `hyena`

[nix-darwin](https://github.com/nix-darwin/nix-darwin) M1 MacBook Air laptop with settings configured and [Homebrew](https://brew.sh/) installed.

[TODO: screenshot]

## General Installation Steps

### NixOS

Using `kangaroo` as an example:

1. Create a bootable USB drive with one of the latest NixOS ISO images from the [downloads page](https://nixos.org/download/).
2. Boot into the NixOS live environment and connect to the internet.
3. Open the terminal and run the following `disko-install` [command](https://github.com/nix-community/disko/blob/master/docs/disko-install.md). If necessary, replace the disk id by choosing one from the output of `ls -l /dev/disk/by-id/`. Caches are passed as options to avoid building Niri and Noctalia.

```
sudo nix run 'github:nix-community/disko/latest#disko-install' -- \
  --flake 'github:andreshungbz/nixconfig#kangaroo' \
  --disk main /dev/disk/by-id/nvme-WD_BLACK_SN850X_2000GB_23424M802412 \
  --write-efi-boot-entries \
  --option substituters "https://cache.nixos.org https://niri.cachix.org https://noctalia.cachix.org" \
  --option trusted-public-keys "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964= noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
```

4. Restart the computer with `reboot`.

### nix-darwin (MacOS)

Using `hyena` as an example:

1. Starting with a fresh install of MacOS, install the [Homebrew](https://brew.sh/) package manager, then install Nix through [Determinate Systems](https://determinate.systems/). Afterwards, restart the computer.
2. Open the terminal and run the following command to create the `Projects` directory, clone this repository, and navigate into it:

```
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

3. Build the first configuration:

```
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#hyena
```

### Standalone Home Manager

The `packet` home consists of both architectures, accessible through `#packet@x86_64-linux` and `#packet@aarch64-linux`. Using `packet@xaarch64-linux` as an example:

1. Install Nix through [Determinate Systems](https://determinate.systems/).
2. Run the following command to create the `Projects` directory, clone this repository, and navigate into it:

```
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

3. Build the first configuration:

```
nix run github:nix-community/home-manager/master -- switch --flake .#packet@aarch64-linux
```

### Post-Installation

For nix-darwin and standalone home manager systems, the default shell can be set to `fish` by running the following command:

```
echo "$(which fish)" | sudo tee -a /etc/shells && chsh -s "$(which fish)"
```

## Inspirations

- Dendritic structures and ideas were greatly inspired by https://tangled.org/quasigod.xyz/nixconfig.
- V2 Starship configuration is adapted from https://github.com/antholeole/nixconfig.
- Previous non-dendritic Nix configurations were inspired by https://github.com/Andrey0189/nixos-config-reborn and https://github.com/dustinlyons/nixos-config.
