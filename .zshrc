# curl -L git.io/antigen > antigen.zsh
export HOME="/home/arul"
export CASK="$HOME/.cask/bin"                      # Used by pdf-tools in emacs
export LOCALBIN="$HOME/.local/bin"
export CABALBIN="$HOME/.cabal/bin"
export PATH="$PATH:$CASK:$LOCALBIN:$CABALBIN"
source ~/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle aws
antigen bundle docker
antigen bundle vagrant
antigen bundle sbt
antigen bundle scala
antigen bundle history
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen theme zakaziko99/agnosterzak-ohmyzsh-theme
antigen apply
