#!/bin/sh

cp -Rf .vim ~/
cp -Rf .tools ~/
cp -f .gitconfig ~/
cp -f .vimrc ~/
if [ `uname` == 'Linux' ]; then
  cp -f .cshrc ~/
else
  cp -f .cshrc-bsd ~/.cshrc
fi
cp .screenrc ~/ 
