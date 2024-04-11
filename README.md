# NixOS

Desktop enviroment:
- i3
- polybar
- rofi
- picom (work in progress...)

Theme available:
- nord
- gruvbox

## Misc

For rebuilding system
```
sudo nixos-rebuild build --flake .
```
To update flake.lock
```
nix flake update
```
### home-manager

To rebuild home-manager with new edits
```
home-manager switch --flake .
```
