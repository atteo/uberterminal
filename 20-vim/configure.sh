#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

echo "Installing custom .vimrc"
chmod 644 ~/.vimrc || true
cp -r .vimrc .vim ~/
chmod 444 ~/.vimrc

mkdir -p ~/.config/nvim
cp -r init.lua lua ~/.config/nvim/

cp neovim.fish ~/.config/fish/conf.d/
cp coc-settings.json ~/.config/nvim/coc-settings.json

vim +PlugUpdate +UpdateRemotePlugins +PlugClean +VimspectorUpdate +CocUpdateSync +'quitall'

vim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
