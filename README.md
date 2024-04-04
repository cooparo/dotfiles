# NixOS
For rebuilding system (enter in the dotfiles dir):
```
sudo nixos-rebuild build --flake .
```

## home-manager

To rebuild home-manager with new edits (enter in the dotfiles dir)
```
home-manager switch --flake .
```

To update flake.lock
```
nix flake update
```

