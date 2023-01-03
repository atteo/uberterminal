" Restore last position in the file
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" highlight last inserted text
nnoremap gV `[v`]

" Make < to not remove selection
vnoremap < <gv
vnoremap > >gv

nmap <leader>x :!xdg-open %<cr><cr>


nnoremap <silent> <F12> :call <SID>ShowColor()<CR>
function! s:ShowColor()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Jenkinsfile support
au BufReadPost Jenkinsfile* set syntax=groovy

try
	source ~/.vimrc.local
catch
	" No such file? No problem; just ignore it.
endtry


"Plug 'tpope/vim-fugitive'
"	nmap <leader>g :Ggrep
"	nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
"
" Shows Git diffs in a bar on the left
" Plug 'airblade/vim-gitgutter'
" 	" ]c - Jump to next hunk
" 	" [c - Jump to previous hunk
" 	" <Leader>hs - Stage hunk
" 	" <Leader>hu - Undo stage hunk
" 	" <Leader>hp - Preview hunk stages
" 	" ic - text object consisting of all lines in hunk
" 	" ac - the same as above plus any trailing empty lines
"
" 	let g:gitgutter_sign_added = '▌'
" 	let g:gitgutter_sign_modified = '▌'
" 	let g:gitgutter_sign_modified_removed = '▌_'
" 	let g:gitgutter_sign_removed_first_line = '¯'
" 	let g:gitgutter_max_signs = 2000
" Expand Region
" + - expand
" _ - shrink
"Plug 'terryma/vim-expand-region'

" Completion engine
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 	inoremap <silent><expr> <c-space> coc#refresh()
" 	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#conirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 
" 	nmap <silent><m-d> <Plug>(coc-definition)
" 	nmap <silent><m-i> <Plug>(coc-implementation)
" 	nmap <silent><m-u> <Plug>(coc-references)
" 	nmap <silent><m-r> <Plug>(coc-rename)
" 	nmap <silent><m-R> <Plug>(coc-refactor)
" 	nmap <silent><m-J> <Plug>(coc-codeaction-line)
" 	nmap <silent><m-j> <Plug>(coc-fix-current)
" 	nmap <silent>]e <Plug>(coc-diagnostic-next)
" 	nmap <silent>[e <Plug>(coc-diagnostic-prev)
" 	nmap <silent><m-o> :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
" 
" 	nnoremap <silent> <m-y> :CocCommand explorer<CR>
" 
" 	" Make sure tabs are moved to the right when explorer is opened
" 	autocmd User CocExplorerOpenPre lua require'bufferline.state'.set_offset(41, 'FileTree')
" 	autocmd User CocExplorerQuitPre lua require'bufferline.state'.set_offset(0)
" 
" 	nnoremap <silent> <m-e> :<C-u>CocList diagnostics<cr>
" 
" 	" navigate chunks of current buffer
" 	nmap [g <Plug>(coc-git-prevchunk)
" 	nmap ]g <Plug>(coc-git-nextchunk)
" 	" navigate conflicts of current buffer
" 	nmap [c <Plug>(coc-git-prevconflict)
" 	nmap ]c <Plug>(coc-git-nextconflict)
" 	" show chunk diff at current position
" 	nmap gs <Plug>(coc-git-chunkinfo)
" 	" show commit contains current position
" 	nmap gc <Plug>(coc-git-commit)
" 	" create text object for git chunks
" 	omap ig <Plug>(coc-git-chunk-inner)
" 	xmap ig <Plug>(coc-git-chunk-inner)
" 	omap ag <Plug>(coc-git-chunk-outer)
" 	xmap ag <Plug>(coc-git-chunk-outer)
" 
" 	nnoremap <silent> <m-h> :call <SID>show_documentation()<CR>
" 
" 	function! s:show_documentation()
" 	  if (index(['vim','help'], &filetype) >= 0)
" 		execute 'h '.expand('<cword>')
" 	  else
" 		call CocAction('doHover')
" 	  endif
" 	endfunction
" 
" 	" Highlight the symbol and its references when holding the cursor.
" 	autocmd CursorHold * silent call CocActionAsync('highlight')

" Plug 'vimwiki/vimwiki'
" 	let g:vimwiki_key_mappings = { 'all_maps': 0, }
" 	let g:vimwiki_list = [{'path': '~/wiki/'}]
" 	map <F1> <Plug>VimwikiIndex
" 	"map <m-d> <Plug>VimwikiFollowLink


" tagbar
" Plug 'liuchengxu/vista.vim'
" 	nmap <m-l> :Vista!!<CR>
" 	let g:vista#renderer#enable_icon = 1
" 
"Plug 'puremourning/vimspector'
"	nmap <F4> <Plug>VimspectorToggleBreakpoint
"	nmap <F5> <Plug>VimspectorContinue
"	nmap <F7> <Plug>VimspectorStepInto
"	nmap <F8> <Plug>VimspectorStepOver
"	nmap <F12> <Plug>VimspectorReset
"	let g:vimspector_install_gadgets = [ 'vscode-bash-debug', 'vscode-cpptools', 'CodeLLDB', 'vscode-java-debug' ]
"

" Use css when exporting as HTML
"let g:html_use_css = "1"


" Show trailing whitespace and spaces before a tab
" But when opening terminal inside VIM don't touch spaces after '➤'
" let c_space_errors = 1
" let java_space_errors = 1
" highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd Syntax * syn match ExtraWhitespace /\(➤\)\@<!\s\+$\| \+\ze\t/
"syn match ExtraWhitespace /\(➤\)\@<!\s\+$\| \+\ze\t/

" Highlight VCS conflict markers
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Paste mode switching
"set pastetoggle=<F6>


" Spell checking
" setlocal spell spelllang=en_us,pl
" hi clear SpellBad
" hi SpellBad cterm=italic
" " Ignore words containing upper case letters when spell checking
" fun! IgnoreCamelCaseSpell()
" 	syn match CamelCase /\<\l\{-}\(\u\|\d\).\{-}\>/ contains=@NoSpell transparent
" 	syn cluster Spell add=CamelCase
" endfun
" autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" Toggle line numbers
" function! NumberToggle()
" 	if(&relativenumber == 1)
" 		set norelativenumber
" 		set number
" 	else
" 		set number!
" 	endif
" endfunc
" nnoremap <silent><leader>N :call NumberToggle()<cr>

" function! RelativeNumberToggle()
" 	if(&relativenumber == 1)
" 		setlocal norelativenumber
" 		setlocal nonumber
" 		highlight LineNr ctermfg=yellow
" 	else
" 		setlocal relativenumber
" 		setlocal number
" 		highlight LineNr ctermfg=green
" 	endif
" endfunc
" nnoremap <silent><leader>n :call RelativeNumberToggle()<cr>

" URL encode/decode selection
" vnoremap <leader>eu :!python -c 'import sys,urllib;print urllib.quote(sys.stdin.read().strip())'<cr>
" vnoremap <leader>du :!python -c 'import sys,urllib;print urllib.unquote(sys.stdin.read().strip())'<cr>
" vnoremap <leader>ex :!python -c 'import sys;from xml.sax.saxutils import escape; print escape(sys.stdin.read().strip())'<cr>
" vnoremap <leader>dx :!python -c 'import sys;from xml.sax.saxutils import unescape; print unescape(sys.stdin.read().strip())'<cr>
"


