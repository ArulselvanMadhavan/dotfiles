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
autoload -U compinit
fpath=($HOME/.bloop/zsh $fpath)
compinit
export CASK="$HOME/.cask/bin"
export LOCALBIN="$HOME/.local/bin"
export PATH="$LOCALBIN:$CASK:$PATH"
# Just start fish shell
# exec fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/arul/dev/cs152/lab1/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/arul/dev/cs152/lab1/conda/etc/profile.d/conda.sh" ]; then
        . "/home/arul/dev/cs152/lab1/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/arul/dev/cs152/lab1/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

