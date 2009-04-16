#!/bin/sh

remote_param="$1"
if [ "${remote_param}x" = "x" ] || [  "${remote_param}x" = "remotex" ]; then
    echo "Remote install"
    is_remote="yes"
elif [ "${remote_param}x" = "localx" ]; then
    echo "Local install"
    is_remote=""
else
    echo "Usage $0 local|remote"
    exit 255
fi
cp -Rf .vim ~/
cp -f .vimrc ~/
if [ "${is_remote}x" = "x" ]; then
    cat ./.vimrc.local >> ~/.vimrc
else 
    cat ./.vimrc.remote >> ~/.vimrc
fi
echo ' ' >> ~/.vimrc 
echo '" Command aliases: ' >> ~/.vimrc 
cat ./.vimrc.cmdalias >> ~/.vimrc

cp -f .gvimrc ~/
cp -Rf .tools ~/
cp -f .gitconfig ~/

cp -f .screenrc ~/
cp -f .gitignore ~/
cp -f .cshrc ~/
./zshkit/install
