PROMPT='%F{254}%2~%f $ '                    # zsh command-line prompt
                                            # https://jonasjacek.github.io/colors/

autoload -U +X compinit && compinit         # autocompletion
compinit

# Some zshrc should only be ran on specific kinds of devices
# Source the files with those commands here
case "$OSTYPE" in 
    darwin*)
        source $HOME/.zshrc-darwin
    ;;
    linux*)
        source $HOME/.zshrc-linux
    ;;
esac

##################################################
# Optional setup for fzf
# https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
##################################################
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

##################################################
# Shell History and Notifications
##################################################
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
unsetopt beep                   # Do not beep on errors

##################################################
# Aliases
##################################################
alias gitfresh='sh ~/.git_fresh.sh'

alias gitcycle='echo "git fetch -q && git pull -q && git push -q";
    git fetch -q && git pull -q && git push -q'

alias chromepen='open -a "Google Chrome"'

##################################################
# ZPlug Plugins
##################################################
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
