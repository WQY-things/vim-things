#!/bin/bash

tar -zxf dev_env_cfg.tar.gz -C ~/ && echo "tar to ~/ successfully!"
#cp -rf .bash_aliases .bashrc .vimrc .zshrc .vim .p10k.zsh .oh-my-zsh ~/

#set git global config
echo "Do you want set git global config?[y/n]"
read ANS
if [[ x"$ANS" = x"y" || x"$ANS" = x"Y" ]]; then
	#statements
	git config --global user.name 'Johnny Wang'
	git config --global user.email '18356533577@163.com'
	git config --global core.editor vim
	git config --global push.default simple
	git config --global core.pager ''
	echo "git config successfully!"
fi

echo "install successfully!"
