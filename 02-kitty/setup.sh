#!/bin/bash

mkdir -p ~/.config/kitty
cp kitty.conf navigator.py pass_keys.py ~/.config/kitty/

#sudo apt-get -y install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
