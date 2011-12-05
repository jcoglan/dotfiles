# Git info in prompt
# http://railstips.org/2009/2/2/bedazzle-your-bash-prompt-with-git-info

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "["${ref#refs/heads/}"]"
}

function parse_nvm_env {
  echo "node-$(echo $NVM_PATH | cut -d"/" -f5)"
}

function parse_rvm_env {
  echo $GEM_HOME | cut -d"/" -f6
}

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[1;34m\]"
BLACK="\[\033[0;30m\]"
WHITE="\[\033[0;37m\]"
DEFAULT_COLOR="\[\033[0;39m\]"

if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
fi

if [ -f ~/.nvm/nvm.sh ]; then
  . ~/.nvm/nvm.sh
fi

PS1="$RED$(hostname)(\$(parse_nvm_env),\$(parse_rvm_env))$BLUE \w$YELLOW\$(parse_git_branch)$DEFAULT_COLOR\n$ "

  
# Change the window title of X terminals
case $TERM in
screen)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
;;
esac

# Turn off beeps
hash xset 2>&- && xset -b

alias ff-video="cp /tmp/Flash*"
alias gr="grep -riTn --color --include"
alias h="hostname"
alias webpy="python -m SimpleHTTPServer"

hash pbcopy 2>&- || {
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
}

alias curl-xhr="curl -H 'X-Requested-With: XMLHttpRequest'"
alias ab-xhr="ab -H 'X-Requested-With: XMLHttpRequest'"

# Git
alias gitd="git daemon --base-path=$HOME/projects --export-all"
alias gpl="git pull --rebase && git submodule update --init --recursive"

# Multiruby
alias spek="multiruby -S spec"
alias cuke="multiruby -S cucumber"
alias jem="multiruby -S gem"
alias jem-install="multiruby -S gem install --no-ri --no-rdoc"

if [ -f ~/.bash_custom ]; then
  . ~/.bash_custom
fi

