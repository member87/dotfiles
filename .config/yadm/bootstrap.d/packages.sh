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
	betterlockscreen \
	bind \
	btop \
	discord \
	dunst \
	edk2-ovmf \
	eza \
	fish \
  librewolf-bin \
	fisher \
	gamemode \
	github-cli \
	i3-wm \
	iptables-nft \
	man \
	man-db \
	neovim \
	npm \
	ntfs-3g \
	openssh \
	pavucontrol \
  compfy \
	playerctl \
	polkit-gnome \
	polybar \
	powerline-fonts \
	proton-ge-custom-bin \
	qt5-styleplugins \
	razergenie \
	rofi \
  maim \
	spicetify-cli \
	spotify \
	starship \
	steam \
	thunar \
	virt-manager \
	wget \
	wine \
	wine-gecko \
	wine-mono \
	xclip \
	xidlehook \
	xss-lock \
  lxapperance \
  catppucin-gtk-theme-mocha \
  ttf-font-awesome \



echo "*****************************************************"
echo "PACKAGE INSTALLATION COMPLETE"
echo "*****************************************************"



