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


which brew &> /dev/null && {
  BREW_HOME="$(brew --prefix)"

  # Setup virtualenvwrapper
  export WORKON_HOME="$HOME/.virtualenvs/"
  VIRTUALENV_WRAPPER="$BREW_HOME/bin/virtualenvwrapper.sh"
  VIRTUALENVWRAPPER_PYTHON="$BREW_HOME/bin/python3"
  [ -f "$VIRTUALENV_WRAPPER" ] && . $VIRTUALENV_WRAPPER
}

# Open tmux from config file.
function t() {
  local file=./.tmux
  if [[ -f $file ]]; then
    bash $file
  else
    tmux $@
  fi
}

# Setup fasd
eval "$(fasd --init posix-alias zsh-hook)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
