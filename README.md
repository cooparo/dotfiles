# NixOS

Desktop enviroment:
- i3
- polybar
- rofi
- picom

Themes available: https://github.com/tinted-theming/schemes/tree/spec-0.11/base16

## Todo

Add:
- [ ] sddm
- [ ] ssh/pgp secrets management

Ricing and eye-bleeding stuff:
- [ ] nixvim - Setup
- [ ] wallpaper - fetch online
- [ ] gtk - fix cursors theme
- [ ] polybar - auto-getting name of network interfaces 
- [ ] polybar - add spotify module


Fix:


## Misc

For rebuilding system
```
sudo nixos-rebuild switch --flake .
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
