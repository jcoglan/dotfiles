#!/bin/bash

if [[ -x /usr/libexec/path_helper ]] ; then
  PATH=''
  eval `/usr/libexec/path_helper -s`
fi

for file in ~/.shell/* ; do
  # shellcheck source=/dev/null
  . "$file"
done
unset file

add-to-path "$HOME/.scripts"

if [[ -f ~/.bash_custom ]] ; then
  # shellcheck source=/dev/null
  . ~/.bash_custom
fi

fortune 2> /dev/null | cowsay 2> /dev/null
