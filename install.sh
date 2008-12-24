#!/bin/sh

cp -Rf .vim ~/
cp -Rf .tools ~/
cp -f .gitconfig ~/
cp -f .vimrc ~/
cp -f .screenrc ~/
cp -f .gitignore ~/

if [ `uname` == 'Linux' ]; then
  cp -f .cshrc ~/
else
  cp -f .cshrc-bsd ~/.cshrc
fi
