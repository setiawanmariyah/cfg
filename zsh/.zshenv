typeset -U path
path=(~/.cargo/bin ~/.perl5/bin ~/.gem/ruby/2.7.0/bin ~/.local/bin ~/.local/lib ~/.pyenv/bin /usr/sbin /sbin $path[@])

BROWSER=$(which google-chrome-stable)

# Set Terminal

if [ -z "$TERMINAL" ]; then
  if (( $+commands[terminator] )); then
    TERMINAL=terminator
  elif (( $+commands[termite] )); then
    TERMINAL=termite
  fi
fi

TERMCMD=$TERMINAL

if [ -d ~/git/mysite ]; then
  export SITE="$HOME/git/mysite"
  export post="$SITE/content/posts"
fi

if [ -d ~/.local/bin ]; then
  export mpath="$HOME/.local/bin/"
fi

if [ -d ~/.perl5 ]; then
  export PERL5LIB="~/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
  export PERL_LOCAL_LIB_ROOT="~/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
  export PERL_MB_OPT="--install_base \"~/.perl5\""
  export PERL_MM_OPT="INSTALL_BASE=~/.perl5"
fi

# Set editor

set_editor() {
  export EDITOR="$@"
  export GIT_EDITOR="$@"
  export VISUAL="$@"
  alias v="$@"
}

# Get editor

get_editor()
{
    if (( $+commands[nvim] )); then
        set_editor $(which nvim)
    elif
        (( $+commands[vim] )); then
        set_editor $(which vim)
    elif (( $+commands[vi] )); then
        set_editor $(which vi)
    fi
}

get_editor

XDG_DATA_HOME=$HOME/.local/share
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0000000" #black
    echo -en "\e]P85e5e5e" #darkgrey
    echo -en "\e]P18a2f58" #darkred
    echo -en "\e]P9cf4f88" #red
    echo -en "\e]P2287373" #darkgreen
    echo -en "\e]PA53a6a6" #green
    echo -en "\e]P3914e89" #darkyellow
    echo -en "\e]PBbf85cc" #yellow
    echo -en "\e]P4395573" #darkblue
    echo -en "\e]PC4779b3" #blue
    echo -en "\e]P55e468c" #darkmagenta
    echo -en "\e]PD7f62b3" #magenta
    echo -en "\e]P62b7694" #darkcyan
    echo -en "\e]PE47959e" #cyan
    echo -en "\e]P7899ca1" #lightgrey
    echo -en "\e]PFc0c0c0" #white
    clear 
fi



export PET_GITLAB_ACCESS_TOKEN=$(pass snippets-api)
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=/run/user/$(id -u)/gnupg/S.gpg-agent.ssh
export PYENV_ROOT="$HOME/.pyenv"
export _JAVA_AWT_WM_NONREPARENTING=1
if [[ "$HOST" != 'raspberrypi' ]]; then
  export LD_PRELOAD=$HOME/.local/bin/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}
else
  export LD_PRELOAD=$HOME/.local/bin/libstderred_for_pi.so${LD_PRELOAD:+:$LD_PRELOAD}
fi
export STDERRED_BLACKLIST="^(git|ffmpeg)$"
export GIT_DISCOVERY_ACROSS_FILESYSTEM=true
