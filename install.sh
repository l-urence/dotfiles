#!/bin/sh -e

D=`cd $(dirname $0) && pwd`
DOT_FILES=$(ls -a | grep -E '^\.{1}[^g]\w+')

# Remove all link .dot files;
if [[ "$1" = "--uninstall" ]]; then
  for file in $DOT_FILES; do
    target=$HOME/$file
    [[ -L $target ]] && rm $target && echo "delete $target"
  done;

  exit 0
fi

# Install all .dot files from this directory
for file in $DOT_FILES; do
  source=$D/$file
  target=$HOME/$file
  [[ -L $target ]] || ln -s $source $target && echo "linkl $target"
done;

