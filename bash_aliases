#!/bin/bash

scripts_path="$HOME/.scripts"
if [[ "$PATH" != *$scripts_path* ]] ; then
  export PATH="$scripts_path:$PATH"
fi

for script in $(ls ~/.shell); do
  . "$HOME/.shell/$script"
done

if [ -f ~/.bash_custom ]; then
  . ~/.bash_custom
fi

fortune 2> /dev/null | cowsay 2> /dev/null
