# Configure PS1.
if [[ -n "$BASH_VERSION"  ]]; then
  if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    export PS1='\W @\h \[\033[01;34m\]>:\[\033[00m\] ';
  else
    export PS1='\W \[\033[01;34m\]>:\[\033[00m\] ';
  fi;
fi;

# Load aliases.
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases;
fi;

# Source local configurations.
if [[ -f ~/.bash_local ]]; then
  source ~/.bash_local;
fi;

# Setup homebrew
export HOMEBREW_HOME=$(([ `uname` = "Linux" ] && echo "/home/linuxbrew/.linuxbrew") || echo '/usr/local');
export PATH="$HOMEBREW_HOME/bin:$PATH";
export PATH="$HOMEBREW_HOME/sbin:$PATH";

# Set defualt editor.
export EDITOR="vim -f";
export GIT_EDITOR="vim -f";

# Add RVM to PATH for scripting. Make sure this is the
# last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin";
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm";

# Setup Java
export JAVA_HOME="/usr/lib/jvm/default"
export PATH="$JAVA_HOME/bin:$PATH"

# Setup Android
export ANDROID_HOME=/home/linuxbrew/.linuxbrew/opt/android-sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/emulator:$PATH"

# Setup virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
source $HOMEBREW_HOME/bin/virtualenvwrapper.sh

# Open tmux from config file.
function t() {
  local file="./.tmux";
  if [[ -f ${file} ]]; then
    bash ${file};
  else
    tmux $@;
  fi
}
