
require('packer').startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- Caching
	use 'lewis6991/impatient.nvim'

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
end)
