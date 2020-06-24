#!bin/bash
#各ソフトがインストールされていなければインストール
if !(type "vim" > /dev/null 2>&1); then
	sudo apt install vim -y
fi
if !(type "tmux" > /dev/null 2>&1); then
	sudo apt install tmux -y
	sudo apt install tmuxp -y
#nerd-fontsをインストールされていてもインストールしちゃう
	mkdir nerd-fonts
	cd nerd-fonts
	git clone https://github.com/ryanoasis/nerd-fonts.git
	sudo ./install.sh
	cd ~/
fi
if !(type "gotop" > /dev/null 2>&1); then
	if !(type "go" > /dev/null 2>&1); then
		sudo apt install golang-go -y
	fi
	go get github.com/cjbassi/gotop
fi
if !(type "ranger" > /dev/null 2>&1); then
	sudo apt install ranger -y
fi
if !(type "w3m" > /dev/null 2>&1); then
	sudo apt install w3m w3m-img -y
fi
if !(type "xfce4-terminal" > /dev/null 2>&1); then
	sudo apt install xfce4-terminal -y
fi
if !(type "chromium-browser" > /dev/null 2>&1); then
	sudo apt install chromium-browser -y
fi
if !(type "ibus" > /dev/null 2>&1); then
	sudo apt install ibus-mozc -y
fi
if !(type "jq" > /dev/null 2>&1); then
    sudo apt install jq -y
fi
#各ドットファイルをシンボリックリンクで結ぶ
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.profile ~/.profile
ln -sf ~/dotfiles/.tmux_local.conf ~/.tmux_local.conf
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim/ ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.viminfo ~/.viminfo
ln -sf ~/dotfiles/.tmux ~/.tmux
