# Nix Configuration

Welcome to my Nix configuration for both macOS and NixOS. This repository contains configuration files and package setup for each host of a respective system. Some configurations are shared between the two systems and between different hosts.

Feel free to explore the repository and take ideas for your Nix configuration!

## Installation

<details>
<summary>MacOS</summary>

### MacOS

1. Install the [Homebrew](https://brew.sh/) package manager.
2. Install [Nix](https://nixos.org/) through the [Determinate Nix](https://determinate.systems/) Installer (answer no to the prompt; `--nix-build-group-id 30000` option added).

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --nix-build-group-id 30000
```

3. Restart the computer.
4. Clone the repository and change into the directory.

```
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

5. Install the selected flake configuration for the first time (e.g., `#AHM1A`).

```
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#AHM1A
```

</details>


## Management

| Action (assuming in project directory) | Command                                      |
| -------------------------------------- | -------------------------------------------- |
| Apply configuration changes (MacOS)    | `sudo darwin-rebuild switch --flake .#AHM1A` |
| Apply configuration changes (NixOS)    | `sudo nixos-rebuild switch --flake .#AHNIX`  |
| Update packages                        | `nix flake update`                           |
| Clean up previous generations          | `sudo nix-collect-garbage --delete-old`      |

## Attributions

Many ideas and lessons learned in the process of organizing this Nix configuration repository are thanks to [Andrey0189's nix configuration](https://github.com/Andrey0189/nixos-config-reborn) and [dustylion's nix configuration](https://github.com/dustinlyons/nixos-config).
