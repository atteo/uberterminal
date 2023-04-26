local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

packer.init {
}

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

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'rcarriga/nvim-notify',
        config = function()
            require('notify').setup({
                background_colour = "#000000",
            })
        end
    }

    use {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_filetypes = {
                [ 'TelescopePrompt' ] = false
            }
        end
    }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            -- Unless you are still migrating, remove the deprecated commands from v1.x
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            require("neo-tree").setup({
                close_if_last_window = false,
            })
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

    use('navarasu/onedark.nvim')

    -- Show scroolbar
    use 'dstein64/nvim-scrollview'

    -- use {
    --     "SmiteshP/nvim-navic",
    --     requires = "neovim/nvim-lspconfig"
    -- }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            { 'kyazdani42/nvim-web-devicons', opt = true }
        },
        config = function()
            -- local navic = require("nvim-navic")
            require('lualine').setup {
                options = {
                    theme = 'onedark'
                },
                winbar = {
                    -- lualine_c = {
                    --     { navic.get_location, cond = navic.is_available },
                    -- }
                },
                extensions = {
                    'nvim-tree',
                    'fugitive',
                    'quickfix',
                    'symbols-outline'
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
               --show_current_context_start = true
            }
        end
    }

    -- Packer
    -- use({
    --     "folke/noice.nvim",
    --     event = "VimEnter",
    --     config = function()
    --         require("noice").setup()
    --     end,
    --     requires = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         "rcarriga/nvim-notify",
    --     }
    -- })

    -- treesitter plugins

    use({
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    })

    use 'nvim-treesitter/nvim-treesitter-context'


    use('p00f/nvim-ts-rainbow')

    use('neovim/nvim-lspconfig')

    use('onsails/lspkind.nvim')

    -- use({
    --     "glepnir/lspsaga.nvim",
    --     branch = "main",
    --     config = function()
    --         local saga = require("lspsaga")

    --         saga.init_lsp_saga({
    --             diagnostic_header_icon = {' ',' ',' ','ﴞ '},
    --         })
    --     end,
    -- })

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
            local lspkind = require('lspkind')
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
                },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol', -- show only symbol annotations
                        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (entry, vim_item)

                            return vim_item
                        end
                    })
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

    use({
        'mfussenegger/nvim-jdtls',
        config = function()
            local jdtls = require('jdtls')
            local util = require('jdtls.util')

            local home = os.getenv('HOME')
            local jdt_ls_root = home .. '/opt/eclipse.jdt.ls'
            local workspace_folder = vim.fn.expand('$HOME/workspace')

            jdtls_group = vim.api.nvim_create_augroup("jdtls", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "java"  },
                callback = function()
                    jdtls.start_or_attach({
                        cmd = {
                            'java',
                            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                            '-Dosgi.bundles.defaultStartLevel=4',
                            '-Declipse.product=org.eclipse.jdt.ls.core.product',
                            '-Dlog.protocol=true',
                            '-Dlog.level=ALL',
                            '-Xms1g',
                            '-Xmx2G',
                            '-jar', jdt_ls_root .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
                            '-configuration', jdt_ls_root .. '/config_linux',
                            '-data', workspace_folder,
                        },
                    })
                end,
                group = jdtls_group
            })

        end
    })

    use({'https://github.com/LhKipp/nvim-nu'})

end)


-- local on_attach = function(client, bufnr)
--     local navic = require("nvim-navic")
--     if client.server_capabilities.documentSymbolProvider then
--         navic.attach(client, bufnr)
--     end
-- end


local ok, lspconfig = pcall(require, 'lspconfig')
if ok then
    lspconfig.pyright.setup {
        on_attach = on_attach
    }
    lspconfig.bashls.setup {
        on_attach = on_attach
    }
    lspconfig.tsserver.setup {
        on_attach = on_attach,

        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" }
    }
    lspconfig.metals.setup {
        on_attach = on_attach
    }
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
        auto_install = true,
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

