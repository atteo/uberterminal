#!/bin/bash

trap "exit 1" ERR

sudo apt-get -y install git git-svn gitk kdiff3 git-gui curl

git config --global rebase.autoStash true
git config --global pull.rebase merges

git config --global core.pager "delta"

git config --global delta.side-by-side true
git config --global delta.line-numbers true
git config --global delta.navigate true # use n and N to move between diff sections
git config --global delta.light false # set to true if you use a light terminal theme

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"


# gitk dark colors
mkdir -p ~/.config/git/
curl https://raw.githubusercontent.com/dracula/gitk/master/gitk -o ~/.config/git/gitk

