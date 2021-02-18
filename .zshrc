PROMPT='%F{254}%2~%f $ '                    # zsh command-line prompt
                                            # https://jonasjacek.github.io/colors/

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

export TERM=xterm-256color


##################################################
# Aliases
##################################################
# Git
alias gs="git status"
alias gn='echo "git reset --hard && git clean -df";
    git reset --hard && git clean -df'
alias gf='sh ~/.git_fresh.sh'
alias gc='echo "git fetch -q && git pull -q && git push -q";
    git fetch -q && git pull -q && git push -q'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Opening applications
alias n='nvim `fzf`'
alias chromepen='open -a "Google Chrome"'

function hejq() {
    stern -o raw heweb | egrep --line-buffered '^{' | jq .;
}
