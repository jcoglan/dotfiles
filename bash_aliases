#!/bin/bash

export PATH="$HOME/.scripts:$PATH"

for script in $(ls ~/.shell); do
  . "$HOME/.shell/$script"
done

if [ -f ~/.bash_custom ]; then
  . ~/.bash_custom
fi

fortune 2> /dev/null | cowsay 2> /dev/null
