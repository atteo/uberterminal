local opt = vim.opt
local g = vim.g

g.mapleader = ","
g.maplocalleader = ",,"

opt.termguicolors = true

-- One status for all windows
opt.laststatus = 3

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

-- Keep at lest 2 lines of context when scrolling
opt.scrolloff=2

-- ignore case if search pattern is all lowercase, case-sensitive otherwise
opt.smartcase = true

-- Show the mode in status line
opt.showmode = true

-- Show partially entered commands in status line
opt.showcmd = true

-- Use 4 space tab, do not change tabs into spaces
opt.tabstop=4
opt.expandtab = true


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

-- Give more space for displaying messages.
opt.cmdheight=2

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append('c')


opt.listchars='tab:▸\\ ,trail:-,eol:¬,extends:>,precedes:<,nbsp:+'

-- Enable mouse support
opt.mouse='a'
opt.mousemodel='popup_setpos'
