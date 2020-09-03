#!/bin/bash

scripts_path="$HOME/.scripts"
if [[ "$PATH" != *$scripts_path* ]] ; then
  export PATH="$scripts_path:$PATH"
fi

for file in ~/.shell/* ; do . "$file" ; done

if [[ -f ~/.bash_custom ]] ; then
  . ~/.bash_custom
fi

fortune 2> /dev/null | cowsay 2> /dev/null
