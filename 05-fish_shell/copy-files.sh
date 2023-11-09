#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

mkdir -p ~/.config/fish
cp -r conf.d completions functions ~/.config/fish/

mkdir -p ~/.config/direnv
cp direnv.toml ~/.config/direnv/
