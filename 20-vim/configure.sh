#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

echo "Copying configuration"
chmod 644 ~/.vimrc ~/.coc-vimrc || true
cp -r .vimrc .coc-vimrc .vim ~/
chmod 444 ~/.vimrc ~/.coc-vimrc

mkdir -p ~/.config/nvim
cp -r init.lua lua ~/.config/nvim/

mkdir -p ~/.coc-config/nvim
cp coc-init.lua ~/.coc-config/nvim/init.lua

cp neovim.fish ~/.config/fish/conf.d/
cp coc-settings.json ~/.config/nvim/coc-settings.json

echo "Running PackerSync..."
vim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo "Running PlugUpdate in coc-vim..."
coc-vim +PlugUpdate +UpdateRemotePlugins +PlugClean +VimspectorUpdate +CocUpdateSync +'quitall'

