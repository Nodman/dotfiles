# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Greetings
echo "May the force be with you, `logname`!"

export LC_ALL=en_GB
export ZSH=/Users/spooner/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  osx
  compleat
  npm
  wd
  vi-mode
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# Pure theme settings
autoload -U promptinit; promptinit
prompt pure
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
alias s="spotify"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/openssl/bin:$PATH"

findr(){
  find $1 -name "$2" | xargs rm
}

RPS1=""
export FZF_DEFAULT_COMMAND='ag --nocolor --path-to-ignore ~/.ignore -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh