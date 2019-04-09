# alias
alias z="j"
alias tmux="tmux -2"
alias vim="nvim"
alias vi="nvim"

# zsh
export TERM=xterm-256color
export ZSH="/Users/ted/.oh-my-zsh"

ZSH_THEME="honukai"

SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# yarn
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/anaconda3/bin"

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# thefuck
eval $(thefuck --alias)
