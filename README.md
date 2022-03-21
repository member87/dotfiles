# Table of Contents  
- [Introduction](https://github.com/member87/dotfiles/edit/nightly/README.md#introduction)
- [Programs](https://github.com/member87/dotfiles/edit/nightly/README.md#programs)
- [Installation](https://github.com/member87/dotfiles/edit/nightly/README.md#installation)
  - [With YADM](https://github.com/member87/dotfiles/edit/nightly/README.md#with-yadm)
  - [Without YADM](https://github.com/member87/dotfiles/edit/nightly/README.md#without-yadm-not-recommended)
- [Media](https://github.com/member87/dotfiles/edit/nightly/README.md#media)

# Introduction
This repository has been created to manage a variety of different config files for my personal Linux computer (I use arch btw). I am currently using [YADM](https://yadm.io/) to manage and generate certain config files. Also, you are able to find my entire neovim config [here](https://github.com/member87/nvim).

## Programs
- i3wm
- polybar
- i3 resurect (restore programs)
- alacritty
- neovim
- rofi
- picom
- dunst
- firefox

# Installation
## With YADM
```shell
yadm clone https://github.com/member87/dotfiles
yadm submodule update --init --recursive
```

## Without YADM (not recommended)
Some configs will not work as YADM is required to generate certain files. However, this can be done manually but it isn't recommended.
```shell
git clone https://github.com/member87/dotfiles/
cd dotfiles
git submodule update --init --recursive
cp -r .config/* ~/.config/
```

# Media
![firefox setup](https://github.com/member87/dotfiles/blob/nightly/.config/yadm/media/firefox.png?raw=true)
![firefox setup](https://github.com/member87/dotfiles/blob/nightly/.config/yadm/media/terminal.png?raw=true)
![firefox setup](https://github.com/member87/dotfiles/blob/nightly/.config/yadm/media/nvim.png?raw=true)
![firefox setup](https://github.com/member87/dotfiles/blob/nightly/.config/yadm/media/spotify.png?raw=true)
![firefox setup](https://github.com/member87/dotfiles/blob/nightly/.config/yadm/media/rofi.png?raw=true)

