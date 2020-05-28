# Configure PS1.
if [[ -n "$BASH_VERSION"  ]]; then
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    export PS1="\W @\h \[\033[01;34m\]>:\[\033[00m\] "
  else
    export PS1="\W \[\033[01;34m\]>:\[\033[00m\] "
  fi
fi

# Load aliases.
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# Source local configurations.
if [[ -f ~/.bash_local ]]; then
  source ~/.bash_local
fi

# Set defualt editor.
export EDITOR="vim -f"
export GIT_EDITOR="vim -f"

# Source plattform dependent stuff.
if [ `uname` = "Linux" ]; then
  BASH_LINUX="$HOME/.bash_linux"
  [ -f $BASH_LINUX ] && source $BASH_LINUX
elif [ `uname` = 'Darwin' ]; then
  BASH_DARWIN="$HOME/.bash_darwin"
  [ -f $BASH_DARWIN ] && source $BASH_DARWIN
fi

VIRTUALENVWRAPPER=/usr/local/bin/virtualenvwrapper.sh
if [ -f  $VIRTUALENVWRAPPER ]; then
  export WORKON_HOME=$HOME/.virtualenvs
  export PROJECT_HOME=$HOME/Devel
  . $VIRTUALENVWRAPPER
fi

# Open tmux from config file.
function t() {
  local file=./.tmux
  if [[ -f $file ]]; then
    bash $file
  else
    tmux $@
  fi
}

# Git - Checkout brach with branch name
function cob() {
  git checkout $(g branch | grep -m 1 $1)
}

# Setup fasd.
eval "$(fasd --init posix-alias zsh-hook)"

# set up fzf.
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
