#!/bin/sh

D=`cd $(dirname $0) && pwd`;

if [[ "$1" = "--uninstall" ]]; then
  ls -a $D | egrep '^\.[^git]\w+' | xargs -I {} sh -c '[[ -L ~/{} ]] && rm ~/{}';

  exit 0;
fi;

ls -a $D | egrep '^\.[^git]\w+' | xargs -I {} sh -c "[[ -L ~/{} ]] || ln -s $D/{} ~/{}";
