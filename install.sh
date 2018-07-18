#!/bin/sh

function exist() {
  which $1 > /dev/null 2>&1
}

function install() {
  exist $1 || {
    (exist yay && yay $1) || \
    (exist brew && brew $1)
  }
}

D=`cd $(dirname $0) && pwd`
REGEX='^\.[^g]\w+'

# Remove all link .dot files;
if [[ "$1" = "--uninstall" ]]; then
  ls -a $D | egrep $REGEX | xargs -I {} sh -c '[[ -L ~/{} ]] && rm ~/{} && echo unlink ~/{}'

  exit 0
fi

# Install all .dot files from this directory
ls -a $D | egrep $REGEX | xargs -I {} sh -c "[[ -L ~/{} ]] || ln -s $D/{} ~/{} && echo link ~/{}"


# Install other stuff;
install fasd
install spotify
install gcloud
install kubectl-bin
install ntp
