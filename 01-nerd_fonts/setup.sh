#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

set -x

cp -r .config .fonts.conf.d ~/

mkdir -p ~/.fonts

cd ~/.fonts

rm NerdFontsSymbolsOnly.zip || true
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/NerdFontsSymbolsOnly.zip

unzip -o NerdFontsSymbolsOnly.zip
rm NerdFontsSymbolsOnly.zip

rm HackLigatured-v3.003+FC3.1+JBMv2.242.zip || true
wget https://github.com/gaplo917/Ligatured-Hack/releases/download/v3.003%2BNv2.1.0%2BFC%2BJBMv2.242/HackLigatured-v3.003+FC3.1+JBMv2.242.zip
unzip -o HackLigatured-v3.003+FC3.1+JBMv2.242.zip
rm HackLigatured-v3.003+FC3.1+JBMv2.242.zip

fc-cache -fv
