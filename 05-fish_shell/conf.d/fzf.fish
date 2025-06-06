set --export FZF_DEFAULT_OPTS '--border --preview-window=wrap --marker="*" --tabstop 4'

fzf_configure_bindings --processes=\eP # --git_log=\el

function my_fzf_preview_file
    if file --mime-type $argv[1] | grep -qF 'image/' &> /dev/null
        # --transfer-mode=memory is the fastest option but if you want fzf to be able
        # to redraw the image on terminal resize or on 'change-preview-window',
        # you need to use --transfer-mode=stream.
        kitty icat --clear --transfer-mode=memory --stdin=no --place={$FZF_PREVIEW_COLUMNS}x{$FZF_PREVIEW_LINES}@0x0 $argv[1]
    else
        kitty icat --clear --transfer-mode=memory --stdin=no --place={$FZF_PREVIEW_COLUMNS}x{$FZF_PREVIEW_LINES}@0x0
        # if argv[2] is present

        if test -n "$argv[2]"
            batcat -f -H $argv[2] $argv[1]
        else
            _fzf_preview_file $argv[1]
        end
    end
end

function my_fzf_edit_file
    if test -n "$argv[2]"
        vim "+$argv[2]" "$argv[1]"
    else
        vim "$argv[1]"
    end
end

function my_fzf_view_file
    # if mime type is html, open in browser
    # else if image open in eog

    if file --mime-type $argv[1] | grep -qF 'text/html' &> /dev/null
        firefox $argv[1]
        return
    end
    if file --mime-type $argv[1] | grep -qF 'image/' &> /dev/null
        eog $argv[1]
        return
    end

    if test -n "$argv[2]"
        batcat -f -H $argv[2] $argv[1]
    else
        _fzf_preview_file $argv[1]
    end
end

function fzf_ag
    set token (commandline --current-token)
    set unrestricted ""

    for arg in $argv
        if test $arg = "--unrestricted"
            set unrestricted "--unrestricted"
        end
    end

    set -f --export SHELL (command --search fish)
    set -x FZF_DEFAULT_COMMAND "ag --nogroup --column --color '$token' $unrestricted || true"

    set result (fzf --ansi --prompt="Ag> " --multi --bind "change:reload:ag --nogroup --column --color {q} $unrestricted || true" \
        --bind 'alt-e:execute(my_fzf_edit_file {1} {2} < /dev/tty > /dev/tty)' \
        --bind 'alt-o:execute(my_fzf_view_file {1} {2} < /dev/tty > /dev/tty)' \
        --phony --delimiter : --with-nth "1..2" --nth "2..-1" \
        --query "$token" --preview-window '+{2}' --preview='my_fzf_preview_file {1} {2}')

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
    commandline --function repaint
end

function fzf_ag_unrestricted
    fzf_ag --unrestricted
end

function fzf_search_directory --description "Search the current directory. Replace the current token with the selected file paths."
    # Directly use fd binary to avoid output buffering delay caused by a fd alias, if any.
    # Debian-based distros install fd as fdfind and the fd package is something else, so
    # check for fdfind first. Fall back to "fd" for a clear error message.
    set fd_cmd (command -v fdfind || command -v fd  || echo "fd")
    set --append fd_cmd --color=always $fzf_fd_opts

    # $fzf_dir_opts is the deprecated version of $fzf_directory_opts
    set fzf_arguments --multi --ansi --bind 'alt-e:execute(vim {} < /dev/tty > /dev/tty)' $fzf_dir_opts $fzf_directory_opts
    set token (commandline --current-token)
    # expand any variables or leading tilde (~) in the token
    set expanded_token (eval echo -- $token)
    # unescape token because it's already quoted so backslashes will mess up the path
    set unescaped_exp_token (string unescape -- $expanded_token)

    # If the current token is a directory and has a trailing slash,
    # then use it as fd's base directory.
    if string match --quiet -- "*/" $unescaped_exp_token && test -d "$unescaped_exp_token"
        set --append fd_cmd --base-directory=$unescaped_exp_token
        # use the directory name as fzf's prompt to indicate the search is limited to that directory
        set --prepend fzf_arguments --prompt="Search Directory $unescaped_exp_token> " --preview="my_fzf_preview_file $expanded_token{}"
        set file_paths_selected $unescaped_exp_token($fd_cmd 2>/dev/null | _fzf_wrapper $fzf_arguments)
    else
        set --prepend fzf_arguments --prompt="Search Directory> " --query="$unescaped_exp_token" --preview="my_fzf_preview_file $expanded_token{}"
        set file_paths_selected ($fd_cmd 2>/dev/null | _fzf_wrapper $fzf_arguments)
    end


    if test $status -eq 0
		set buffer (commandline --current-buffer)

		if [ "$buffer" = "$token" ]
			commandline --current-token --replace -- "vim $(string escape -- $file_paths_selected | string join ' ')"
		else
			commandline --current-token --replace -- (string escape -- $file_paths_selected | string join ' ')
		end
    end

    commandline --function repaint
end

bind \eg fzf_ag
bind \eG fzf_ag_unrestricted
bind \ef fzf_search_directory

bind -M insert \eg fzf_ag
bind -M insert \eG fzf_ag_unrestricted
bind -M insert \ef fzf_search_directory
