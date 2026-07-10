# Nix Configuration

This repository contains my dentritic Nix configurations for a variety of hosts using the aspect-oriented [Den](https://den.denful.dev/) Nix framework. Aspects are defined in the `modules/aspects` directory and are often grouped in `modules/aspects/stacks`. These are included in the various home and host configurations, defined in `modules/homes` and `modules/hosts`, respectively. The `dotfiles` directory contains miscellaneous configuration files that are not integrated with Nix.

## Showcase

### `kangaroo`

[NixOS](https://nixos.org/) AMD gaming desktop running [Niri](https://github.com/niri-wm/niri) and [Noctalia](https://noctalia.dev/) v5, testable with the `nix run .#vm-kangaroo` command.

![Screenshot of the kangaroo desktop.](./assets/screenshots/2026-06-14-kangaroo.png)

### `hyena`

[nix-darwin](https://github.com/nix-darwin/nix-darwin) M1 MacBook Air laptop with settings configured and [Homebrew](https://brew.sh/) installed.

![Screenshot of the hyena desktop.](./assets/screenshots/2026-06-14-hyena.png)

## General Installation Steps

<details>
<summary>NixOS</summary>

Using `kangaroo` as an example:

1. Create a bootable USB drive with one of the latest NixOS ISO images from the [downloads page](https://nixos.org/download/).
2. Boot into the NixOS live environment and connect to the internet.
3. [Optional] If necessary, clone the repository and set up the proper hardware configuration for the particular system. Replace the contents of the `_hardware.nix` file with the output of `nixos-generate-config --no-filesystems --show-hardware-config --root /tmp` and choose the drive to install to by replacing the device attribute in the `disko.nix` file with one chosen from the output of `ls -l /dev/disk/by-id/`. Run `git add .` then replace the `--flake` argument in the next steps with `.#kangaroo`.
4. Open the terminal and run the following `disko` command to format the appropriate drive.

```
sudo nix \
  --extra-experimental-features 'nix-command flakes' \
  run 'github:nix-community/disko/latest' -- \
  --mode disko \
  --flake 'github:andreshungbz/nixconfig#kangaroo'
```

5. Install the system with the `nixos-install` command, passing the following options. Additional caches are included to avoid building Niri and Noctalia.

```
sudo nixos-install \
  --no-channel-copy \
  --no-root-password \
  --flake 'github:andreshungbz/nixconfig#kangaroo' \
  --option extra-experimental-features "nix-command flakes" \
  --option substituters "https://cache.nixos.org https://noctalia.cachix.org" \
  --option trusted-public-keys "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
```

6. Restart the computer with `reboot`.

</details>

<details>
<summary>nix-darwin (MacOS)</summary>

Using `hyena` as an example:

1. Starting with a fresh install of MacOS, install the [Homebrew](https://brew.sh/) package manager, then install Nix through [Determinate Systems](https://determinate.systems/). Afterward, restart the computer.
2. Open the terminal and run the following command to create the `Projects` directory, clone this repository, and navigate into it:

```
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

3. Build the first configuration. Some Homebrew casks may prompt for the `sudo` password, so the installation cannot be fully unattended.

```
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#hyena
```

4. Rebuild the configuration with `nix-darwin` to properly apply `$HOME`.

```
sudo nix-darwin rebuild --flake .#hyena
```

5. Restart the computer and configure any remaining settings.

</details>

<details>
<summary>home-manager (standalone)</summary>

The `packet` home contains both architectures, accessible via `#packet@x86_64-linux` and `#packet@aarch64-linux`. Using `packet@xaarch64-linux` as an example:

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

</details>

<details>
<summary>Post-Installation</summary>

For nix-darwin and home-manager (standalone) systems, the default shell can be set to `fish` by running the following command:

```
echo "$(which fish)" | sudo tee -a /etc/shells && chsh -s "$(which fish)"
```

When dual-booting NixOS with Windows, run another rebuild so that grub can detect the Windows partition and add it to the boot menu. Windows should also be configured to use UTC, so that there isn't a time mismatch when switching between the two operating systems. See https://wiki.archlinux.org/title/System_time#UTC_in_Microsoft_Windows

</details>

## Management Commands

| Action               | `nh` Command                                   | Regular Command                                      |
| -------------------- | ---------------------------------------------- | ---------------------------------------------------- |
| NixOS Rebuild        | `nh os switch --ask`                           | `sudo nixos-rebuild switch --flake .#kangaroo`       |
| nix-darwin Rebuild   | `nh darwin switch --ask`                       | `sudo darwin-rebuild switch --flake .#hyena`         |
| home-manager Rebuild | `nh home switch --ask -c packet@aarch64-linux` | `home-manager switch --flake .#packet@aarch64-linux` |
| Garbage Collection   | `nh clean all --ask`                           | `sudo nix-collect-garbage -d`                        |

## Inspirations

- [quasigod](https://tangled.org/quasigod.xyz/nixconfig) (dendritic structure and modules)
- [Adda](https://codeberg.org/Adda/nixos-config) (more ideas for dendritic repository structure)
- [antholeole](https://github.com/antholeole/nixconfig) (adapted [starship](https://starship.rs/) configuration)
- [Andrey0189](https://github.com/Andrey0189/nixos-config-reborn) (non-dendritic NixOS configurations for old configuration)
- [dustinlyons](https://github.com/dustinlyons/nixos-config) (non-dendritic nix-darwin configurations for old configuration)
