# Git info in prompt
# http://railstips.org/2009/2/2/bedazzle-your-bash-prompt-with-git-info

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLACK="\[\033[0;30m\]"
WHITE="\[\033[0;37m\]"

PS1="$RED\w$YELLOW \$(parse_git_branch)$BLACK\$ "

# Turn off beeps
xset -b

alias gr="grep -riTn --color --include"
alias webpy="python -m SimpleHTTPServer"
alias h="hostname"

# Git
alias gitd="git daemon --base-path=$HOME/projects --export-all"
alias gpl="git pull --rebase && git submodule update"

# Multiruby
alias spek="multiruby -S spec"
alias cuke="multiruby -S cucumber"
alias jem="multiruby -S gem"
alias jem-install="multiruby -S gem install --no-ri --no-rdoc"

if [ -f ~/.bash_custom ]; then
    . ~/.bash_custom
fi

