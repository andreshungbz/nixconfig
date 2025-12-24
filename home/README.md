# Home Manager Standalone Configurations

## Installation Instructions

1. Install [Nix](https://nixos.org/) through the [Determinate Nix](https://determinate.systems/) Installer.

2. Restart the shell.

3. Install Home Manager globally.

```
nix profile add "github:nix-community/home-manager"
```

4. Create a `Projects` directory and clone this repository.

```
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

5. Rebuild the configuration with the flake.

```
home-manager switch --flake .#MAIN-ARM
```

## Management

| Action                                               | Command                                  |
| ---------------------------------------------------- | ---------------------------------------- |
| Apply configuration changes (in nixconfig directory) | `home-manager switch --flake .#MAIN-ARM` |
| Update packages                                      | `nix flake update`                       |
| Clean up previous generations                        | `nix-collect-garbage --delete-old`       |
