require('packer').startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Caching
	use 'lewis6991/impatient.nvim'

    use 'tpope/vim-repeat'

	-- common functions
	use "nvim-lua/plenary.nvim"

	-- Suport for http://editorconfig.org/
	use 'gpanders/editorconfig.nvim'

	-- Change surroundings
	use 'kylechui/nvim-surround'
		-- cs'"   -- change surrounding ' to "
		-- cs"<a> -- change surrounding " to <a>...</a>
		-- cst'   -- change surrounding tags to '
		-- ds'    -- delete surrounding '
		-- yss]   -- add surrounding [ and ] for the entire line
		-- ysw]   -- add surrounding [ and ] from current position to the end of current word
		-- ysiw]  -- add surrounding [ and ] for the current word

	use 'kyazdani42/nvim-web-devicons'
	use {
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'}
	}


	use 'rcarriga/nvim-notify'

	use 'ggandor/lightspeed.nvim'

	use 'github/copilot.vim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
      -- or                            , branch = '0.1.x',
	  requires = {'nvim-lua/plenary.nvim'}
	}

	use {
	  "Pocco81/auto-save.nvim",
	  config = function()
        require("auto-save").setup {
		  -- your config goes here
		  -- or just leave it empty :)
		}
	  end
    }

	use {
      "gbprod/yanky.nvim",
       config = function()
         vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
         vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
		 vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
		 vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
		 vim.keymap.set("n", "<c-P>", "<Plug>(YankyCycleForward)")
		 vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
         require("yanky").setup({
         })
       end
    }

	-- use({
    --   'rakr/vim-one',
	--   config = function()
	-- 	vim.cmd('colorscheme one')
	-- 	vim.cmd('set background=dark')
	-- 	vim.cmd('let g:one_allow_italics = 1 " italic for comments')
	-- 	vim.cmd("let g:airline_theme='one'")
	--   end,
	-- })
    
    use 'navarasu/onedark.nvim'

    -- Show scroolbar
    use 'dstein64/nvim-scrollview'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'onedark'
                }
            }
        end
    }

    use 'neovim/nvim-lspconfig'

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp", 'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 
        }
    }

    use {
        'notjedi/nvim-rooter.lua',
        config = function() require'nvim-rooter'.setup() end
    }

    -- Move seamlessly between vim and kitty windows
    use('knubie/vim-kitty-navigator')
    -- Move seamlessly between vim and tmux windows
    use('tmux-plugins/vim-tmux-focus-events')

    use({
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })

    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use { 'junegunn/fzf', run = './install --bin', }

    use('RRethy/nvim-treesitter-endwise')
  
    use('p00f/nvim-ts-rainbow')
    use('andymass/vim-matchup')

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use('dhura/vim-table-mode')

    -- using packer.nvim
    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end
    }

    require('nvim-treesitter.configs').setup {
        highlight = {
            enable = true, 
        },
        endwise = {
            enable = true,
        },
        indent = {
            enable = true
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
        },
        matchup = {
            enable = true,
        },
    }
end)


require('onedark').setup {
    style = 'darker',
    transparent = true
}
require('onedark').load()

vim.api.nvim_set_keymap('n', '<m-f>', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<m-q>', "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })

