PROMPT='%F{208}%2~%f $ '                    # zsh command-line prompt

autoload -U +X compinit && compinit
source <(kubectl completion zsh)            # Auto-Completion support for kubectl
compinit

source <(helm completion zsh)               # Auto-Completion support for helm

# Optional setup for fzf
# https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

##################################################
# Aliases
##################################################
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
