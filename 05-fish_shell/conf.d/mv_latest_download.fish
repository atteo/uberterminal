function mv_latest_download
    set -l downloads "$HOME/Downloads"
    # Find the latest file (quoted to handle spaces)
    set -l latest (command ls -t "$downloads" | head -n 1)

    if test -z "$latest"
        echo "No files found in $downloads"
        return 1
    end

    set -l src "$downloads/$latest"
    set -l dst (pwd)/"$latest"

    # Stage the command into the buffer. 
    # Using 'commandline -f execute' tells fish to run it immediately.
    commandline -r "mv -iv -- \"$src\" \"$dst\""
    commandline -f execute
end

# function mv_latest_download
#     set downloads "$HOME/Downloads"
# 
#     # Get most recently modified entry
#     set latest (command ls -t $downloads | head -n 1)
# 
#     if test -z "$latest"
#         echo "mv_latest_download: No files found in $downloads"
#         return 1
#     end
# 
#     set src "$downloads/$latest"
#     set dst (pwd)/"$latest"
# 
#     if not test -f "$src"
#         echo "mv_latest_download: Latest item is not a regular file: $src"
#         return 1
#     end
# 
#     # Get filesystem device numbers
#     set src_dev (stat -f -c %d "$src")
#     set dst_dev (stat -f -c %d (pwd))
# 
#     if test "$src_dev" != "$dst_dev"
#         echo "Moving across filesystems"
#         echo "  From: $src"
#         echo "  To:   $dst"
#         read -P "This will copy+delete. Continue? [y/N] " answer
# 
#         if not string match -qr '^[Yy]' -- $answer
#             echo "Aborted."
#             return 1
#         end
#     end
# 
#     echo "# Moving '$latest'"
#     if ! command mv -i -- "$src" "$dst"
#         echo "Move failed."
#         return 1
#     end
#     commandline -f repaint
# end

bind alt-m mv_latest_download

