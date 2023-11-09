function ls --wraps ls
	#grc ls --color -C -w (tput cols) $argv
	eza --icons --git --hyperlink $argv
end
