#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

echo "Copying configuration"
chmod 644 ~/.vimrc || true
cp -r .vimrc .vim ~/
chmod 444 ~/.vimrc

mkdir -p ~/.config/nvim
cp -r init.lua lua ~/.config/nvim/

cp neovim.fish ~/.config/fish/conf.d/

echo "Running PackerSync..."
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'TSUpdateSync' 

