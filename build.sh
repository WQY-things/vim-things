#!/bin/bash

#cp  -rf ~/.bash_aliases ~/.bashrc ~/.vimrc ~/.zshrc ~/.vim ~/.p10k.zsh ~/.oh-my-zsh ./
tar -zcvf dev_env_cfg.tar.gz .bash_aliases .bashrc .vimrc .zshrc .vim .p10k.zsh .oh-my-zsh install.sh

echo -e "\n\n===build dev_env_cfg.tar.gz successfully!===\n\n"
