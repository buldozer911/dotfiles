# Path to your oh-my-zsh installation.
  export ZSH="/home/dev/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  npm
  sudo
  fast-syntax-highlighting
  zsh-autosuggestions
  you-should-use
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=">"
prompt pure

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

source /usr/share/nvm/init-nvm.sh

export VIMCONFIG="~/.vim"
export FZF_DEFAULT_COMMAND="rg --files"
export VISUAL='nvim'

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Avoid Nesting Nvim within
#if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
#  if [ -x "$(command -v nvr)" ]; then
#    alias nvim=nvr
#  else
#    alias nvim='echo "No nesting!"'
#  fi
#fi
