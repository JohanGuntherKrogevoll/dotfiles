This could probably be scripted at some point. Maybe i could do something inspired by [this macOS Configuration project](https://github.com/bkuhlmann/mac_os-config) or [this Nix for MacOS project](https://github.com/dustinlyons/nixos-config).

...but ill just throw something here for now:

```
brew update
brew install node
Brew install gh
brew install azure-cli
brew install --cask mouse-fix
brew install --cask slack 
brew install --cask bitwarden
brew install --cask signal
brew install --cask visual-studio
brew install --cask docker
brew install --cask visual-studio-code
brew install --cask discord
brew install --cask spotify
brew install --cask insomnia
brew install --cask warp
brew install --cask karabiner-elements
brew install --cask rectangle
brew tap homebrew/cask-drivers
brew install steelseries-exactmouse-tool

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

npm install -g @bitwarden/cli
```
