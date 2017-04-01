#!/bin/sh

D=`cd $(dirname $0) && pwd`;
REGEX='''^\.[^g]\w+';

if [[ "$1" = "--uninstall" ]]; then
  ls -a $D | egrep $REGEX | xargs -I {} sh -c '[[ -L ~/{} ]] && rm ~/{} && echo unlink ~/{}';

  exit 0;
fi;

ls -a $D | egrep $REGEX | xargs -I {} sh -c "[[ -L ~/{} ]] || ln -s $D/{} ~/{} && echo link ~/{}";
