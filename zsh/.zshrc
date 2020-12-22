# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# Greetings
echo "May the force be with you, `logname`!"
 export LC_ALL=en_GB.UTF-8  
export LANG=en_GB.UTF-8
export ZSH=/Users/spooner/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="refined"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gitfast
  osx
  compleat
  npm
  wd
  vi-mode
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# Pure theme settings
autoload -U promptinit; promptinit
prompt purer
PURE_PROMPT_SYMBOL=➜

# 10ms for key sequences
KEYTIMEOUT=1

# Aliases
alias reload="source $HOME/.zshrc"
alias wc="wm-cli"
alias py2="python"
alias py3="python3"
alias tmux="tmux -u"
alias ssh='TERM=xterm-256color ssh'
alias vim="nvim"
alias vi="nvim"
alias scr="screen"
alias tsm="transmission-remote"

#shpotify
alias s="spotify"
alias play="spotify play"
alias stop="spotify stop"
alias pause="spotify pause"
alias replay="spotify replay"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# export BAT_THEME="Dracula"
export BAT_THEME="Nord"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/openssl/bin:$PATH"
export EDITOR="nvim"

findr(){
  find $1 -name "$2" | xargs rm
}

RPS1=""
export FZF_DEFAULT_COMMAND='ag --nocolor --path-to-ignore ~/.ignore -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_complete_git() {
    ARGS="$@"
    local branches
    branches=$(git branch -vv) # --all for all branches
    if [[ $ARGS == 'git co'* ]]; then
        _fzf_complete "--reverse --multi" "$@" < <(
            echo $branches
        )
    else
        eval "zle ${fzf_default_completion:-expand-or-complete}"
    fi
}

_fzf_complete_git_post() {
  awk '{print $1}'
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Change cursor with support for inside/outside tmux
bindkey -v

function _set_cursor() {
    if [[ $TMUX = '' ]]; then
      echo -ne $1
    else
      echo -ne "\ePtmux;\e\e$1\e\\"
    fi
}

function _set_block_cursor() { _set_cursor '\e[2 q' }
function _set_beam_cursor() { _set_cursor '\e[6 q' }

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
      _set_block_cursor
  else
      _set_beam_cursor
  fi
}
zle -N zle-keymap-select
# ensure beam cursor when starting new terminal
precmd_functions+=(_set_beam_cursor) #
# ensure insert mode and beam cursor when exiting vim
zle-line-init() { zle -K viins; _set_beam_cursor }
