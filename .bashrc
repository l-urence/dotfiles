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

# Set defualt editor.
export EDITOR="vim -f";
export GIT_EDITOR="vim -f";

# Activate nvm.
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Build maven subprojects and docker images.
function ms() {
  mvn clean package -am -pl `echo $@ | tr ' ' ','` docker:build -DskipTests;
}

# Get the name of a pod by its app lable.
function get_pod_name() {
  kubectl get pod -l "short=$1" -o jsonpath='{.items[].metadata.name}';
}

# Print logs from kubernetes.
function kl() {
  kubectl logs -f `get_pod_name $1` $2;
}

# Port forwards kubernetes container.
function kpf() {
  kubectl port-forward `get_pod_name $1` $2;
}

# Open tmux from config file.
function t() {
  local file="./.tmux";
  if [[ -f ${file} ]]; then
    bash ${file};
  else
    tmux $@;
  fi
}
