# Nix Configurations - MacOS/NixOS

## Installation

### MacOS

1. Install [Homebrew](https://brew.sh/).
2. Install regular [Nix](https://nixos.org/) through the [Determinate Nix](https://determinate.systems/) Installer (answer no to installing Determinate Nix).

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --nix-build-group-id 30000
```

3. Restart computer.
4. Clone the repository and change into the directory.

```
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

5. Install the selected flake configuration for the first time.

```
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#AHM1A
```

### NixOS

1. Install [NixOS](https://nixos.org/) on the computer.
2. In `etc/nixos/configuration.nix`, add the `git` package and add the following lines to enable flakes.

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

3. Make an initial switch to the configuration.

```
sudo nixos-rebuild switch
```

4. Clone the repository and change into the directory.

```
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

5. Copy over the generated `hardware-configuration.nix` and add it to the git.

```
cp /etc/nixos/hardware-configuration.nix ./nixos/AHNIX/ && git add .
```

6. Back up the current configuration.

```
sudo mv /etc/nixos /etc/nixos.bak
```

7. Create a symbolic link to the new configuration.

```
sudo ln -s ~/Projects/nixconfig /etc/nixos
```

8. Install the selected flake configuration for the first time.

```
sudo nixos-rebuild switch --flake .#AHNIX
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

### NixOS

After making changes to the configuration, run the following command to apply them.

```
sudo nixos-rebuild switch --flake .#AHNIX
```

Cleaning up the system can be done with the following command with and without sudo.

```
sudo nix-collect-garbage --delete-old
```
