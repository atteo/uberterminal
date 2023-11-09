function __fish_preview_current_file --description "Open the file at the cursor in a pager"

    # commandline -t will never return an empty list. However, the token
    # could comprise multiple lines, so join them into a single string.
    set -l file (commandline -t | string collect)
    # count $file is 1

    # $backslash will parsed as regex which may need additional escaping.
    set -l backslash '\\\\'
    not status test-feature regex-easyesc && set backslash $backslash$backslash
    test -z $file && set file (string replace -ra -- '([ ;#^<>&|()"\'])' "$backslash\$1" (commandline -oc)[-1])
    # count $file is 0 or 1

    set -q file[1] || return
    # Now file contains exactly one element, the unexpanded token.

    # strip -option= from token if present
    set file (string replace -r -- '^-[^\s=]*=(.*)' '$1' $file)
    true # Clear $status from string replace, we don't want to return because of it.

    eval set -l files $file || return # Return when eval fails.

    if set -q files[1] && test -f $files[1]

        # if file ends with .pdf, .ps, .tiff, .djvu, .dvi, .epub, .cbz, .cbt, .cbr, .cb7
        if string match -q '*.pdf' $files[1] '*.ps' $files[1] '*.tiff' $files[1] '*.djvu' $files[1] '*.dvi' $files[1] '*.epub' $files[1] '*.cbz' $files[1] '*.cbt' $files[1] '*.cbr' $files[1] '*.cb7' $files[1]
            set -f pager evince --
        # if file is an image
        else if string match -q '*.jpg' $files[1] '*.jpeg' $files[1] '*.gif' $files[1] '*.bmp' $files[1] '*.tif' $files[1] '*.tiff' $files[1] '*.png' $files[1]
            set -f pager eog --
        else
            set -f pager batcat --
        end

        $pager $files
        commandline -f repaint
    end
end
