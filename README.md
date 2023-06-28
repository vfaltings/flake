# NixOS Flake

This repo contains my NixOS flake. Currently there is only a single host which corresponds to my laptop setup.

To use this flake, navigate to the root of this repo and run

```
sudo nixos-rebuild switch --flake .#nixos
```
