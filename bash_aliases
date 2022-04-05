#!/bin/bash

if [[ -f /etc/profile ]] ; then
  PATH=''
  # shellcheck source=/dev/null
  . /etc/profile
fi

for file in ~/.shell/* ; do
  # shellcheck source=/dev/null
  . "$file"
done

add-to-path "$HOME/.scripts"

if [[ -f ~/.bash_custom ]] ; then
  # shellcheck source=/dev/null
  . ~/.bash_custom
fi

fortune 2> /dev/null | cowsay 2> /dev/null
