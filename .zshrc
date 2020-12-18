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

export TERM=xterm-256color

alias gitfresh='sh ~/.git_fresh'

alias gitcycle='echo "git fetch -q && git pull -q && git push -q";
    git fetch -q && git pull -q && git push -q'

alias chromepen='open -a "Google Chrome"'

alias giveMeK8s='cd ~/Workspace/k8s;
    gitfreshmaster &&
    ./tools/setup_dev_environment.py;
    k9s'
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
