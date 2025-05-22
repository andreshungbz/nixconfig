# Nix Configurations - MacOS/NixOS

## Installation

### MacOS

1. Install XCode in the terminal.

```
xcode-select --install
```

2. Install [Homebrew](https://brew.sh/).
3. Install regular [Nix](https://nixos.org/) through the [Determinate Nix](https://determinate.systems/) Installer (answer no to installing Determinate Nix).

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --nix-build-group-id 30000
```

4. Clone the repository and change into the directory.

```
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

5. Install the selected flake configuration for the first time.

```
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#AHM1A
```

## Management

### MacOS

After making changes to the configuration, run the following command to apply them.

```
sudo darwin-rebuild switch --flake .#AHM1A
```

Cleaning up the system can be done with the following command with and without sudo.

```
sudo nix-collect-garbage --delete-old
```
