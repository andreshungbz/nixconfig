# NixOS Machines

## Installation Instructions

1. Install [NixOS](https://nixos.org/) on the computer using the official images and boot into the system.
2. Enable flakes and add the `git` package.

```
sudo nano etc/nixos/configuration.nix
```

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
# add git package
```

```
sudo nixos-rebuild switch
```

3. Create a `Projects` directory and clone this repository.

```
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/andreshungbz/nixconfig.git && cd nixconfig
```

4. Back up the initial configuration and link the new configuration.

```
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/Projects/nixconfig /etc/nixos
```

5. Replace the hardware configuration file with the auto-generated one.

```
sudo cp /etc/nixos.bak/hardware-configuration.nix ./nixos/AHNIX/
```

6. Rebuild configuration with the flake and restart the computer.

```
sudo nixos-rebuild switch --flake .#AHNIX && sudo reboot now
```

## Management

| Action                        | Command                                     |
| ----------------------------- | ------------------------------------------- |
| Apply configuration changes   | `sudo nixos-rebuild switch --flake .#AHNIX` |
| Update packages               | `nix flake update`                          |
| Clean up previous generations | `sudo nix-collect-garbage --delete-old`     |
