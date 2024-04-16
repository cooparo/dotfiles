# NixOS

Desktop enviroment:
- i3
- polybar
- rofi
- picom (work in progress...)

Themes available: https://github.com/tinted-theming/schemes/tree/spec-0.11/base16

## Todo

Add:
- [ ] sddm
- [ ] qt/gtk
- [ ] ssh/pgp secrets management

Ricing and eye-bleeding stuff:
- [x] rofi - Add shortcut (mod+o) for windows switching 
- [ ] rofi - Resize (width) drun window
- [ ] nixvim - Setup
- [x] alacritty - Theming
- [ ] wallpaper - fetch online
- [ ] polybar - Rice default config bar

Fix:
- [x] picom - Doesn't works

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
