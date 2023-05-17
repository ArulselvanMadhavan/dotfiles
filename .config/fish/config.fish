if status is-interactive
    # Commands to run in interactive sessions can go here
end

# opam configuration
source /home/arul/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# Pyenv virtualenv
status --is-interactive; and pyenv init - |  source
status --is-interactive; and pyenv virtualenv-init - | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/arul/mambaforge/bin/conda
    eval /home/arul/mambaforge/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

