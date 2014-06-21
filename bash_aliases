# Turn off beeps
# which xset >/dev/null && xset -b

export EDITOR=vim

alias ff-video="cp /tmp/Flash*"
alias gr="grep -riTn --color --include"
alias h="hostname"
alias pyweb="python -m SimpleHTTPServer"
alias pyjson="python -m json.tool"

which pbcopy >/dev/null || {
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
}

alias curl-xhr="curl -H 'X-Requested-With: XMLHttpRequest'"
alias ab-xhr="ab -H 'X-Requested-With: XMLHttpRequest'"

alias osx-pip-install-env="ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future"

# Dev tool helpers
alias be="bundle exec"
alias ne="npm run-script"
alias gem-uninstall="gem list | cut -d' ' -f1 | xargs gem uninstall -Iax"

alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Git
alias gitd="git daemon --base-path=$HOME/projects --export-all"
alias gpl="git pull --rebase && git submodule update --init --recursive"
alias gsu="git submodule update --init --recursive"

# Git info in prompt
# http://railstips.org/2009/2/2/bedazzle-your-bash-prompt-with-git-info
function get-git-branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "["${ref#refs/heads/}"]"
}

export MD5_MANIFEST=".manifest.md5"
alias intchk="time intchk-verify-files"
function intchk-generate-manifest {
  local tmpfile="/tmp/$RANDOM.md5"
  find . -type f -a ! -name "$MD5_MANIFEST" -print0 | xargs -0 md5sum -b > "$tmpfile"
  mv "$tmpfile" "$MD5_MANIFEST"
}
function intchk-check-files-against-manifest {
  md5sum -c "$1" 2>&1 | grep FAILED
  return "${PIPESTATUS[0]}"
}
function intchk-verify-files {
  if [ -e "$MD5_MANIFEST" ]; then
    if intchk-check-files-against-manifest "$MD5_MANIFEST"; then
      echo "Updating file manifest ..."
      intchk-generate-manifest
    else
      echo "Files do not match the manifest"
    fi
  else
    echo "Generating new file manifest ..."
    intchk-generate-manifest
  fi
}

# Load chruby
. /usr/local/share/chruby/chruby.sh
function get-chruby-version {
  chruby | grep "*" | cut -d" " -f3
}

# Load nvm
[ -f ~/.nvm/nvm.sh ] && . ~/.nvm/nvm.sh
function get-nvm-version {
  echo "$NVM_PATH" | cut -d"/" -f5
}
which vault > /dev/null && . "$( vault --initpath )"

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[1;34m\]"
BLACK="\[\033[0;30m\]"
WHITE="\[\033[0;37m\]"
DEFAULT_COLOR="\[\033[0;39m\]"

PS1="$RED$(hostname)(\$(get-nvm-version),\$(get-chruby-version))$BLUE \w$YELLOW\$(get-git-branch)$DEFAULT_COLOR\n$ "

# This makes Vim et al use the full color palette
if [ "$COLORTERM" = "gnome-terminal" ]; then
  export TERM=xterm-256color
fi

# Change the window title of X terminals
if [ "$TERM" = "screen" ]; then
  PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
fi

function lolbanner {
  banner "$1" | sed "s/#/$2/g" | sed "s/ /$3/g"
}

function remove-trailing-lines() {
  sed -e :a -e '/^\n*$/{$d;N;}' -e '/\n$/ba' $1 > $1.sed-tmp
  chmod --reference $1 $1.sed-tmp
  mv $1.sed-tmp $1
}

[ -f ~/.bash_custom ] && . ~/.bash_custom

fortune 2> /dev/null | cowsay 2> /dev/null
