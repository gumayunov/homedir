#!/bin/sh

rm -Rf ~/.vim.prev
mv ~/.vim ~/.vim.prev
cp -Rf .vim ~/
cp -f .vimrc ~/
is_remote="$1"
if [ "${is_remote}local" = "local" ]; then
    cat ./.vimrc.local >> ~/.vimrc
else
    cat ./.vimrc.remote >> ~/.vimrc
fi;

cp -Rf .tools ~/
cp -f .gitconfig ~/

cp -f .screenrc ~/
cp -f .gitignore ~/
cp -f .cshrc ~/
./zshkit/install
