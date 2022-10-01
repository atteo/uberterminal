local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

packer.startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Caching
    use 'lewis6991/impatient.nvim'

    use 'tpope/vim-repeat'

    -- common functions
    use "nvim-lua/plenary.nvim"

    -- Suport for http://editorconfig.org/
    use 'gpanders/editorconfig.nvim'

    -- Typing a shebang line causes the file type to be re-detected.
    -- Additionally the file will be automically made executable (chmod +x) after the next write.
    use 'tpope/vim-eunuch'
        -- Also add folowing commands:
        -- :Delete - delete the current file
        -- :Move - move the current file
        -- :Rename - rename the current file
        -- :Chmod - change the permissions of the current file
        -- :SudoWrite - write the current file with sudo
        -- :SudoEdit - edit the current file with sudo
        -- and other

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

    use 'cohama/lexima.vim'

    use 'rcarriga/nvim-notify'

    use {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_filetypes = { 
                [ 'TelescopePrompt' ] = false
            }
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        cmd = { 'NvimTreeToggle', 'NvimTreeOpen', 'NvimTreeClose', 'NvimTreeRefresh',
            'NvimTreeFindFile', 'NvimTreeFindFileToggle', 'NvimTreeFocus' },
        config = function()
            require('nvim-tree').setup {
                renderer = {
                    group_empty = true
                },
                filters = {
                    dotfiles = true
                }
            }
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Easy motion
    use 'ggandor/lightspeed.nvim'
        -- s<chars> - jump to the occurence of chars

    use('mrjones2014/legendary.nvim')

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

    use {
        "KabbAmine/zeavim.vim",
        opt = true,
        cmd  = { "Zeavim" }
    }

    use('navarasu/onedark.nvim')

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

    use {
        'notjedi/nvim-rooter.lua',
        config = function() require'nvim-rooter'.setup() end
    }

    -- Move seamlessly between vim and kitty windows
    use('knubie/vim-kitty-navigator')
    -- Move seamlessly between vim and tmux windows
    use('tmux-plugins/vim-tmux-focus-events')

    use {'kevinhwang91/nvim-bqf', ft = 'qf'}

    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
        requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use { 'junegunn/fzf', run = './install --bin', }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },

        config = function()
            require('telescope').setup {
                defaults = {
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_ignore_patterns = { "node_modules", "target" },
                    path_display = { "truncate" },
                    mappings = {
                        n = { ["q"] = require("telescope.actions").close },
                    },
                }
            }
        end
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
            local ok, telescope = pcall(require, 'telescope')
            telescope.load_extension("file_browser")
        end
    }

    -- Extends vim build in %
    use('andymass/vim-matchup')
        -- % - jump
        -- motions: g%, [%, ]%, z%
        -- supports treesitter

    use {
        "fladson/vim-kitty",
        ft = { "kitty" }
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    use('dhruvasagar/vim-table-mode')

    use {
        'nmac427/guess-indent.nvim',
        config = function() require('guess-indent').setup {} end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        'vimoutliner/vimoutliner',
        ft = 'otl'
    }

    use {
        'johnfrankmorgan/whitespace.nvim',
        config = function ()
            require('whitespace-nvim').setup({
                -- configuration options and their defaults

                -- `highlight` configures which highlight is used to display
                -- trailing whitespace
                highlight = 'DiffDelete',

                -- `ignored_filetypes` configures which filetypes to ignore when
                -- displaying trailing whitespace
                ignored_filetypes = { 'TelescopePrompt' }
            })
        end
    }

    use('mbbill/undotree')

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_theme = 'dark'
        end,
        ft = { "markdown" },
    })

    use {
        'gelguy/wilder.nvim',
        config = function()
            local wilder = require('wilder')
            wilder.setup({modes = {':'}})
        end,
    }

    use {
        "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        cmd = { "TroubleToggle", "Trouble" },
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        'kosayoda/nvim-lightbulb',
        requires = 'antoinemadec/FixCursorHold.nvim',
    }
    use({
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
    })


    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup {
               char = "▏",
               filetype_exclude = {"help", "terminal", "dashboard"},
               buftype_exclude = {"terminal"},
               show_trailing_blankline_indent = false,
               show_first_indent_level = false,
               show_current_context = true,
               show_current_context_start = true
            }
        end
    }

    -- treesitter plugins

    use({
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })


    use('p00f/nvim-ts-rainbow')

    use('neovim/nvim-lspconfig')

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            'hrsh7th/cmp-nvim-lua',
            -- words completion in english
            -- 'octaltree/cmp-look',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'f3fora/cmp-spell',
        },

        config = function()
            local cmp = require'cmp'
            cmp.setup({
                mapping = {
                    ['<Up>'] = cmp.mapping.select_prev_item(),
                    ['<Down>'] = cmp.mapping.select_next_item(),
                    ['<C-Up>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-Down>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    })
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'buffer' },
                    { name = 'look' },
                    { name = 'calc' },
                    { name = 'spell' },
                }
            })
        end
    }

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'mfussenegger/nvim-dap'

    -- highligh symbol under cursor
    use 'rrethy/vim-illuminate'

    -- language support
    use({
        'scalameta/nvim-metals',
        requires = { "nvim-lua/plenary.nvim" },
        config = function()

            local metals_config = require("metals").bare_config()

            nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "scala", "sbt" },
                callback = function()
                    require('metals').initialize_or_attach(metals_config)
                end,
                group = nvim_metals_group
            })
        end
    })

end)



local ok, lspconfig = pcall(require, 'lspconfig')
if ok then
    lspconfig.pyright.setup{}
end

local ok, onedark = pcall(require, 'onedark')
if ok then
    onedark.setup {
        style = 'darker',
        transparent = true,
        code_style = {
            comments = 'italic',
            functions = 'bold',
            keywords = 'NONE',
            strings = 'NONE',
            variables = 'NONE',
        },
        lualine = {
            transparent = true
        }
    }
    onedark.load()
    -- Make sign column transparent
    vim.cmd('highlight SignColumn ctermbg=0')

    -- Colors for the vim-illuminate
    vim.cmd('highlight IlluminatedWordText guibg=#264249')
    -- when variable is read
    vim.cmd('highlight IlluminatedWordRead guibg=#264249')
    -- when variable is written
    vim.cmd('highlight IlluminatedWordWrite guibg=#4b2424')

    -- Color for LSP highlight, not used with vim-illuminate
    -- vim.cmd('highlight LspReferenceText ctermbg=DarkGrey')
    -- vim.cmd('highlight LspReferenceRead ctermbg=DarkGrey')
    -- vim.cmd('highlight LspReferenceWrite ctermbg=DarkGrey')
    --
    -- Custom color for search
    vim.cmd('highlight Search guibg=#48b0bd')
end

-- Treesitter config
local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if ok then
    treesitter.setup {
        highlight = {
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
end

