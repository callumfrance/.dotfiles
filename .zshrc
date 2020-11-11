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

##################################################
# ZPlug Plugins
##################################################
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'       # let zplug manage zplug
zplug "paulirish/git-open", as:plugin                       # git open command

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

alias gitfreshmaster='if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "yes, is a git repo"
    git checkout master && git fetch && git pull
else
    echo "no, is not a git repo"
fi'
