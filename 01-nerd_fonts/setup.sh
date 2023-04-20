#!/bin/bash

# More safety, by turning some bugs into errors.
set -euCo pipefail
IFS=$'\n\t'

getLatestReleaseFromGitHub() {
	local repo="$1"
	local tagFilter="${2:-}"

	local releases
	releases="$(curl --silent "https://api.github.com/repos/$repo/releases")" || (echo >&2 "Failed to fetch releases from GitHub, try 'curl --silent \"https://api.github.com/repos/$repo/releases\"' && return 1")

	local tags
	tags="$(echo "$releases" | jq -r '.[] | .tag_name')" || (echo >&2 "Failed to get tags from GitHub API."; return 1)

	if [[ -n "$tagFilter" ]]; then
		tags="$(echo "$tags" | grep "$tagFilter")"
	fi

	local latestTag
	latestTag="$(echo "$tags" | head -n 1)"

	local result
	result="$(curl --silent "https://api.github.com/repos/$repo/releases/tags/$latestTag" | jq -r '.assets[].browser_download_url')"

	if [[ -z "$result" ]]; then
		echo >&2 "not found"
		exit 1
	fi

	echo -n "$result"
}

url="$(getLatestReleaseFromGitHub "ryanoasis/nerd-fonts" | grep -F "NerdFontsSymbolsOnly.zip")"

set -x

cp -r .config .fonts.conf.d ~/

mkdir -p ~/.fonts

cd ~/.fonts

rm NerdFontsSymbolsOnly.zip || true
curl -L -o NerdFontsSymbolsOnly.zip "$url" 

unzip -o NerdFontsSymbolsOnly.zip

rm NerdFontsSymbolsOnly.zip

rm HackLigatured-v3.003+FC3.1+JBMv2.242.zip || true
wget https://github.com/gaplo917/Ligatured-Hack/releases/download/v3.003%2BNv2.1.0%2BFC%2BJBMv2.242/HackLigatured-v3.003+FC3.1+JBMv2.242.zip
unzip -o HackLigatured-v3.003+FC3.1+JBMv2.242.zip
rm HackLigatured-v3.003+FC3.1+JBMv2.242.zip

fc-cache -fv
