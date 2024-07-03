# NixOS

## Memo

For rebuilding system
```shell
sudo nixos-rebuild switch --flake .
```
To update flake.lock
```shell
nix flake update
```
To update the channel
```shell
nix-channel --update
```
Remove unused stuff:
```shell
# system level
doas nix-collect-garbage --delete-older-than 7d
# user level
nix-collect-garbage --delete-older-than 7d
```

### home-manager

To rebuild home-manager with new edits
```shell
home-manager switch --flake .
```
