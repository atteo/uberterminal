#!/bin/bash

set -ex

#curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# Neovim currently installed from GitHub manually
#sudo add-apt-repository -y ppa:neovim-ppa/stable
#sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get -y install curl git aspell-pl universal-ctags build-essential cmake python3-dev golang-go fzf vifm ripgrep shfmt shellcheck ccls nodejs #neovim 

npm install pyright bash-language-server typescript-language-server typescript

echo "Installing ViM spell checking files"
mkdir -p ~/.vim/spell
for lang in pl.utf-8 en.utf-8; do
    curl -o ~/.vim/spell/$lang.spl -z ~/.vim/spell/$lang.spl "http://ftp.vim.org/pub/vim/runtime/spell/$lang.spl"
done

./configure.sh

