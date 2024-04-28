function ps
    # if argument is -ef then remove it
    # if test "$argv[1]" = "-ef"
    #     set argv[1] ""
    # end
	# procs --pager disable --color always $argv
    #
    # disable for now, because 'procs --color always | less' is not working
    /bin/ps $argv
end
