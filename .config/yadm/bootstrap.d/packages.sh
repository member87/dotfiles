#!/bin/sh

if ! command -v yay &> /dev/null
then
	echo "yay not found - installing ..."
	sudo pacman -S git
	pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
fi


echo "*****************************************************"
echo "BEGGING PACKAGE INSTALLATION"
echo "*****************************************************"


yay -S --needed --removemake --nocleanmenu --nodiffmenu --noconfirm \
	alacritty \
	bash-language-server \
	betterlockscreen \
	bind \
	btop \
	cava \
	chaotic-keyring \
	chaotic-mirrorlist \
	discord \
	dunst \
	edk2-ovmf \
	exa \
	firefox \
	fish \
	fisher \
	gamemode \
	github-cli \
	i3-gaps \
	i3-resurrect \
	iptables-nft \
	lazygit-git \
	lua-language-server \
	lxappearance \
	man \
	man-db \
	neovim \
	nordvpn-bin \
	npm \
	ntfs-3g \
	openrgb-bin \
	openssh \
	pavucontrol \
	picom-ibhagwan-git \
	playerctl \
	polkit-gnome \
	polybar \
	powerline-fonts \
	proton-ge-custom-bin \
	qt5-styleplugins \
	ranger \
	razergenie \
	rofi \
	scrot \
	spicetify-cli \
	spotify \
	starship \
	steam \
	thunar \
	tmux \
	virt-manager \
	w3m \
	wget \
	wine \
	wine-gecko \
	wine-mono \
	wireshark-qt \
	xclip \
	xidlehook \
	xss-lock 



echo "*****************************************************"
echo "PACKAGE INSTALLATION COMPLETE"
echo "*****************************************************"



