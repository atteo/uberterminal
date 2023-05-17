local opt = vim.opt
local g = vim.g

g.mapleader = ","
g.maplocalleader = ",,"

opt.termguicolors = true

-- One status for all windows
opt.laststatus = 3

-- Don't show the mode
opt.showmode = false

-- Show partially entered commands in status line
opt.showcmd = false

-- Hide command line by default
opt.cmdheight = 0

-- When switching buffers jump to the existing window, if the buffer is already
-- opened there
opt.switchbuf = "usetab"

-- Show completion menu with description
opt.completeopt="menuone,preview"

-- When wrapping paragraphs, don't end lines with 1-letter words (looks stupid)
opt.formatoptions:append("1")

-- Adds g to :substitute automatically,
-- for example, instead of :%s/foo/bar/g you just type :%s/foo/bar/
opt.gdefault = true

-- Always show menu
opt.guioptions="mt"


-- Hide the buffer instead of closing it. When using :e,
-- it won't ask to write changes in current buffer.
opt.hidden = true

-- ignore case when searching
opt.ignorecase = true

-- Keep a few lines of context when scrolling
opt.scrolloff=10

-- ignore case if search pattern is all lowercase, case-sensitive otherwise
opt.smartcase = true

-- Use 4 space tab, do not change tabs into spaces
opt.tabstop=4
opt.expandtab = true
opt.shiftwidth=4


-- Fixes the problem with timeout after pressing ESC key
-- First configure the terminal to send two 'ESC ESC' sequence instead of
--  single 'ESC' after Escape key is pressed
opt.timeoutlen=500
opt.ttimeoutlen=0

-- CursorHold event trigger after 1 second instead of default 4
opt.updatetime=500

-- Move to the next and previous line when using cursor keys
opt.whichwrap='b,s,<,>,[,]'

-- <tab> shows all possible commands
opt.wildmode='longest,list'

-- :split should open at the bottom
opt.splitbelow = true
opt.splitright = true

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
opt.signcolumn='yes:2'

-- Do not add new line automatically
opt.fixendofline = false

-- Reread changed files automatically
opt.autoread = true

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append('c')

-- Show log messages in the command line
opt.shortmess:remove('F')

-- Swap file warning removal, allows opening of files that are already open in
-- another Vim instance
opt.shortmess:append('A')

opt.listchars='tab:▸\\ ,trail:-,eol:¬,extends:>,precedes:<,nbsp:+'

-- Enable mouse support
opt.mouse='a'
opt.mousemodel='popup_setpos'


-- Make backups in ~/.vim/tmp
opt.backup = true
opt.backupdir = vim.fn.stdpath('data') .. '/backup'

-- Allow undo to work even after exit from vim
-- You must create the directory ~/.vim/undodir manually!
opt.undofile = true
opt.undolevels=1000 -- maximum number of changes that can be undone
opt.undoreload=10000 -- maximum number of lines to save for undo on a buffer

-- Highlight current line
opt.cursorline = true

-- :W writes using sudo
-- TODO: use legendary to define this
vim.cmd('command! W w !sudo tee % > /dev/null')

-- Use extended regular expressions
vim.cmd('nnoremap / /\\v')
vim.cmd('vnoremap / /\\v')

