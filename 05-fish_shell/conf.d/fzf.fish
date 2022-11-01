fzf_configure_bindings --directory=\ef --processes=\eP

function fzf_ag
	set token (commandline --current-token)
	#set expanded_token (eval echo -- $token)
	#set unescaped_exp_token (string unescape -- $expanded_token)

	set -x FZF_DEFAULT_COMMAND "ag --nogroup --column --color '$token' || true"

	set result (fzf --ansi --prompt="Ag> " --multi --bind "change:reload:ag --nogroup --column --color {q} || true" --phony --delimiter : --with-nth "1..2" --nth "2..-1" --query "$token" --preview='bat -f -H {2} {1}' --preview-window '+{2}')

	if test $status -eq 0
		set file_paths_selected (echo "$result" | cut -f1 -d':')
		set first_search_line (echo "$result" | cut -f2 -d':' | head -n1)

		set buffer (commandline --current-buffer)

		if string match -qr '^\s*vim' "$buffer"
			commandline --current-token --replace -- "+$first_search_line $(string escape -- $file_paths_selected | string join ' ')"
		else if [ "$buffer" = "$token" ]
			commandline --current-buffer --replace -- "vim +$first_search_line $(string escape -- $file_paths_selected | string join ' ')"
		else
			commandline --current-token --replace -- (string escape -- $file_paths_selected | string join ' ')
		end

	end
end

bind \eq fzf_ag
