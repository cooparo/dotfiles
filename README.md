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

- [x] qt/gtk

Ricing and eye-bleeding stuff:
- [ ] nixvim - Setup
- [ ] wallpaper - fetch online
- [ ] polybar - Rice default config bar
- [ ] gtk - fix cursors theme

- [x] rofi - Resize (width) drun window
- [x] rofi - fix rofi theme
- [x] rofi - Add shortcut (mod+o) for windows switching 
- [x] alacritty - Theming

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
