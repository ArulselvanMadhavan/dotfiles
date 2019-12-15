# Show git status
function fish_prompt
  set -l last_status $status

  if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
  end
  if not set -q __fish_git_prompt_color_branch
    set -g __fish_git_prompt_color_branch brmagenta
  end
  if not set -q __fish_git_prompt_showupstream
    set -g __fish_git_prompt_showupstream "informative"
  end
  if not set -q __fish_git_prompt_showdirtystate
    set -g __fish_git_prompt_showdirtystate "yes"
  end
  if not set -q __fish_git_prompt_color_stagedstate
    set -g __fish_git_prompt_color_stagedstate yellow
  end
  if not set -q __fish_git_prompt_color_invalidstate
    set -g __fish_git_prompt_color_invalidstate red
  end
  if not set -q __fish_git_prompt_color_cleanstate
    set -g __fish_git_prompt_color_cleanstate brgreen
  end

  printf '%s%s %s%s%s%s ' (set_color $fish_color_host) (prompt_hostname) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt)

  if not test $last_status -eq 0
    set_color $fish_color_error
  end
  echo -n '$ '
  set_color normal
end

# Color hostname
if set -q SSH_TTY
  set -g fish_color_host brred
end
# Run Neofetch
neofetch
# Add cabal to path
set -gx PATH $PATH "~/.cabal/bin"
# Add bloop
set -gx PATH $PATH "~/.bloop"
# Add cargo bin
set -gx PATH $PATH "~/.cargo/bin"
# Add rust src path
set -gx RUST_SRC_PATH (echo (rustc --print sysroot)/lib/rustlib/src/rust/src)
# EMacs
set -U EDITOR emacs
set -gx OPAMEDITOR emacs
# NVM
# bass source ~/.nvm/nvm.sh

# opam configuration
source /home/arul/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# Erlang OTP PATH
set -x ERL_OTP "~/dev/otp"
# Erlang rebar3 path
set -gx PATH "~/.cache/rebar3/bin" $PATH
# Set some nice Erlang variables - copied from https://adoptingerlang.org/docs/development/setup/
set -x ERL_AFLAGS "+pc unicode -kernel shell_history enabled"
