# Dotfiles

This is a collection of some of my dotfiles.
Im very happy if you want to take it for a spin
or have any ideas on how it could be improved 😊

## Setting up nix

Im using Nix for managing all my packages and applications. This was heavily inspired by [this](https://www.youtube.com/watch?v=Z8BL8mdzWHI&t=1491s) video.

### Install Nix

You can get started by installing [Nix package manager](https://nixos.org/):

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### Install Nix Darwin

Then install [nix-darwin](https://github.com/LnL7/nix-darwin):

```bash
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake ~/dotfiles/nix#mac
```

### Edit and rebuild

To rebuild the Nix configuration after editing it. Run:

```
darwin-rebuild switch --flake ~/dotfiles/nix#mac
```

or (after using Stow to apply the aliases.sh):

```bash
ndr
```

## GNU Stow

The dotfiles is managed using [GNU Stow](https://www.gnu.org/software/stow/) which is installed in the steps above.

[This is the simple guide](https://dr563105.github.io/blog/manage-dotfiles-with-gnu-stow/) i used on how to get started using Stow.
