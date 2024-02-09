export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  kubectl
  docker
  kube-ps1
)

source $ZSH/oh-my-zsh.sh

. ~/.alias
. ~/.export
. ~/.addon
