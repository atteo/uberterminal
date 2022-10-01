local ok, which_key = pcall(require, "which-key")

if not ok then
  return
end

which_key.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

-- Normal mode
which_key.register({
    ['Y'] = { "y$", "Yank to end of line" },
    ['<A-left>'] = { "<c-o>", "Jump to previous file" },
    ['<A-right>'] = { "<c-i>", "Jump to next file"},
    ['<leader>z'] = { "Zeavim", "Open documentation in Zeal" },
    ['<m-t>'] = { "<cmd>:NvimTreeFindFileToggle<CR>", "Open tree view" },
    ['<leader>i'] = { "<cmd>:set list!<cr>", "Toggle show/hide invisible chars" },
    ['<leader>u'] = { "<cmd>UndotreeToggle<cr>", "Toggle undo tree" },
    ['<leader>w'] = { "<cmd>lua require('whitespace-nvim').trim()<cr>", "Trim trailing whitespace" },
    ['<leader>b'] = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", "Toggle blame" },

    -- Fzf
    --['<m-f>'] = { "<cmd>lua require('fzf-lua').files()<CR>", "Find files" },
    --['<m-q>'] = { "<cmd>lua require('fzf-lua').live_grep()<CR>", "Live grep" },

    -- Telescope
    ["<leader>f"] = { "<cmd> Telescope<CR>", "telescope" },
    ["<m-f>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<m-F>"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<m-q>"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },

    ["<m-e>"] = { "<cmd> TroubleToggle<cr>", "toggle error list" },

    -- lsp
    ["<m-d>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Find definition" },
    ["<m-i>"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Find implementation" },
    ["<m-u>"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Find usages" },
    ["<m-r>"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    ["<m-j>"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
    ["<c-space>"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
})

-- Visual mode
which_key.register({
    ['<leader>w'] = { "<cmd>lua require('whitespace-nvim').trim()<cr>", "Trim trailing whitespace" },
}, { mode = "v" })


