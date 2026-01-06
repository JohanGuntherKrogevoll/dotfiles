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
# pnpm end

# ↓ Updates PATH for the Google Cloud SDK.
if [ -f '/Users/johanguntherkrogevoll/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/johanguntherkrogevoll/google-cloud-sdk/path.zsh.inc'; fi

#  ↓ Enables shell command completion for gcloud.
if [ -f '/Users/johanguntherkrogevoll/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/johanguntherkrogevoll/google-cloud-sdk/completion.zsh.inc'; fi


printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh" }}\x9c'

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"

 export NIXPKGS_ALLOW_UNFREE=1

source "/Users/johanguntherkrogevoll/aliases.sh"
eval "$(zoxide init zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(mise activate zsh)"
