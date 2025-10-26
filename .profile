if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

clear
if [ -t 1 ]; then
  exec zsh
fi
