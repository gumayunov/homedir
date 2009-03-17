#!/bin/zsh

cp -Rf .vim ~/
cp -Rf .tools ~/
cp -f .gitconfig ~/
cp -f .vimrc ~/
cp -f .screenrc ~/
cp -f .gitignore ~/
cp -f .cshrc ~/
rm -Rf ~/.zsh_script
cp -Rf zshkit ~/.zsh_script
~/.zsh_script/install
