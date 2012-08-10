# Git info in prompt
# http://railstips.org/2009/2/2/bedazzle-your-bash-prompt-with-git-info
function get_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "["${ref#refs/heads/}"]"
}

if [ -f ~/.nvm/nvm.sh ]; then
  . ~/.nvm/nvm.sh
fi

function get_nvm_version {
  echo "node-$(echo $NVM_PATH | cut -d"/" -f5)"
}

if [ -s "$HOME/.rbenv/bin" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

function get_rbenv_version {
  echo "ruby-$(rbenv version | cut -d" " -f1)"
}

if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
fi

function get_rvm_version {
  echo $GEM_HOME | cut -d"/" -f6
}

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[1;34m\]"
BLACK="\[\033[0;30m\]"
WHITE="\[\033[0;37m\]"
DEFAULT_COLOR="\[\033[0;39m\]"

PS1="$RED$(hostname)(\$(get_nvm_version),\$(get_rbenv_version))$BLUE \w$YELLOW\$(get_git_branch)$DEFAULT_COLOR\n$ "

  
# Change the window title of X terminals
case $TERM in
screen)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
;;
esac

# Turn off beeps
which xset >/dev/null && xset -b

alias ff-video="cp /tmp/Flash*"
alias gr="grep -riTn --color --include"
alias h="hostname"
alias webpy="python -m SimpleHTTPServer"

which pbcopy >/dev/null || {
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
}

alias curl-xhr="curl -H 'X-Requested-With: XMLHttpRequest'"
alias ab-xhr="ab -H 'X-Requested-With: XMLHttpRequest'"

alias rb="rbenv exec"
alias be="bundle exec"
alias gem-uninstall="gem list | cut -d' ' -f1 | xargs gem uninstall -Iax"

# Git
alias gitd="git daemon --base-path=$HOME/projects --export-all"
alias gpl="git pull --rebase && git submodule update --init --recursive"
alias gsu="git submodule update --init --recursive"

if [ -f ~/.bash_custom ]; then
  . ~/.bash_custom
fi

