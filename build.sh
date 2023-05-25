#!/bin/bash

cp -rf .bash_aliases .bashrc .vimrc .zshrc .vim .p10k.zsh .oh-my-zsh ~/

#set git global config
git config --global user.name 'Johnny Wang'
git config --global user.email '18356533577@163.com'
git config --global core.editor vim
git config --global push.default simple
git config --global core.pager ''

echo "cp to ~/ successfully!"
