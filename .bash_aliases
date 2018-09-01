# Set aliases
alias ls='ls -Gh';
alias ll='ls -l';
alias l='ll -a';
alias pass='gopass';
# alias shutdown='sudo shutdown';
# alias reboot='sudo reboot';
alias http='python -m SimpleHTTPServer 3000';
alias cat='bat';

# Tmux
alias ta='tmux attach-session -t';
alias tl='tmux list-sessions';

# Python / django
alias ipython='ipython --pylab';
alias activate='. ./.venv/bin/activate';
alias runserver='./manage.py runserver';

# Git
alias status='git status';
alias push='git push';
alias pull='git pull';
alias cm='git commit';
alias co='git checkout'

# K8s
alias ku='kubectl';

# Docker
alias dc='docker-compose';
alias dclean='docker-compose stop && docker-compose rm -af';
alias dcu='dc up -d';
alias dcl='dc logs -f';
alias dl='docker logs -f';

# Add OSX specific aliases
[[ `uname` == "Darwin" ]] && {
  alias purge='sudo purge';
  alias o='open';
  alias oo='open .';

  # Show/hide hidden files in Finder
  alias show="defaults write com.apple.finder AppleShowAllFiles -boolean true && killall Finder";
  alias hide="defaults write com.apple.finder AppleShowAllFiles -boolean false && killall Finder";

  # Hide/show all desktop icons (useful when presenting)
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder";
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder";
};

[[ `uname` == "Linux" ]] && {
  alias open="xdg-open";
  alias paste="xclip -o -selection clipboard";
  alias copy="xclip -selection clipboard";
  alias freeram="sudo sh -c 'free -h && sync && echo 3 > /proc/sys/vm/drop_caches && free -h'";
};
