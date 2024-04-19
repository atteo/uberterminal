function ls --wraps ls
	#grc ls --color -C -w (tput cols) $argv
	eza --icons --git --hyperlink --git-repos --color always $argv
end
