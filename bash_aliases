for script in $(ls ~/.bash); do
  . "$HOME/.bash/$script"
done

if [ -f ~/.bash_custom ]; then
  . ~/.bash_custom
fi

fortune 2> /dev/null | cowsay 2> /dev/null
