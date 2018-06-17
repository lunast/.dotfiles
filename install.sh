#!/bin/sh
[ -d ~/.fonts ] || mkdir ~/.fonts
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/Xmodmap ~/.Xmodmap
ln -sf ~/.dotfiles/latexmkrc ~/.latexmkrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/fonts/UbuntuMonoNerdFontComplete-Bold.ttf ~/.fonts/UbuntuMonoNerdFontComplete-Bold.ttf
ln -sf ~/.dotfiles/fonts/UbuntuMonoNerdFontComplete-Regular.ttf ~/.fonts/UbuntuMonoNerdFontComplete-Regular.ttf
