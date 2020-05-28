#!/bin/sh
.bash_aliases
.bash_linux
.bash_profile
.bashrc
.fzf.zsh
.git
.gitignore
.tmux.conf
.vimrc
.zshrc

D=`cd $(dirname $0) && pwd`
REGEX_NO_GIT='^\.[^g]\w+'

# Remove all link .dot files;
if [[ "$1" = "--uninstall" ]]; then
  ls -a $D | egrep $REGEX_NO_GIT | xargs -I {} sh -c '[[ -L ~/{} ]] && rm ~/{} && echo unlink ~/{}'
  exit 0
fi

# Install all .dot files from this directory
ls -a $D | egrep $REGEX | xargs -I {} sh -c "[[ -L ~/{} ]] || ln -s $D/{} ~/{} && echo link ~/{}"

