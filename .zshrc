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
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export CASK="$HOME/.cask/bin"
export LOCALBIN="$HOME/.local/bin"
export PATH="$LOCALBIN:$CASK:$PATH"
