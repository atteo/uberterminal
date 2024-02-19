#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

echo "Copying configuration"
chmod 644 ~/.vimrc || true
cp -r .vimrc .vim ~/
chmod 444 ~/.vimrc

cp neovim.fish ~/.config/fish/conf.d/

