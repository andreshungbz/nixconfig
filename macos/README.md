# MacOS

1. Install the [Homebrew](https://brew.sh/) package manager.
2. Install [Nix](https://nixos.org/) through the [Determinate Nix](https://determinate.systems/) Installer (answer no to the prompt; `--nix-build-group-id 30000` option added).

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --nix-build-group-id 30000
```

3. Restart the computer.

4. Create a `Projects` directory and clone this repository.

```
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

5. Rebuild the configuration with the flake.

```
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#AHM1A
```

## Management

| Action                              | Command                                      |
| ----------------------------------- | -------------------------------------------- |
| Apply configuration changes (MacOS) | `sudo darwin-rebuild switch --flake .#AHM1A` |
| Update packages                     | `nix flake update`                           |
| Clean up previous generations       | `sudo nix-collect-garbage --delete-old`      |
