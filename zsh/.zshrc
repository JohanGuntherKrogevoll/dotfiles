export PATH=/Users/johanguntherkrogevoll/.local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
plugins=(git)

export EDITOR='lvim'

# pnpm
export PNPM_HOME="/Users/johanguntherkrogevoll/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm endexport PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johanguntherkrogevoll/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johanguntherkrogevoll/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/johanguntherkrogevoll/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johanguntherkrogevoll/google-cloud-sdk/completion.zsh.inc'; fi


export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"

# Nix
 if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi
 export NIXPKGS_ALLOW_UNFREE=1

## Team Hope Setup - Start
export hopeGitRoot="$HOME/dev/strawberry/hope"
source "$HOME/dev/strawberry/hope/.dev/shells/.zshrc"
## Team Hope Setup - End

source "/Users/johanguntherkrogevoll/aliases.sh"


