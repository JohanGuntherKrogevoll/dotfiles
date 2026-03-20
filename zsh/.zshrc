eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export EDITOR='nvim'

# TODO: Lets align the home folder on next install on either my linux or mac. 
# source "/home/jgk/aliases.sh" #Mac
source "/home/johangk/aliases.sh" #Linux

export HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

