# NixOS

## Memo

For rebuilding system
```
sudo nixos-rebuild switch --flake .
```
To update flake.lock
```
nix flake update
```
To update the channel
```
nix-channel --update
```

### home-manager

To rebuild home-manager with new edits
```
home-manager switch --flake .
```
