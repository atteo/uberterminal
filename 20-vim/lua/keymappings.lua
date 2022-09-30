
which_key = require("which-key")

which_key.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

-- Normal mode
which_key.register({
    ['<m-f>'] = { "<cmd>lua require('fzf-lua').files()<CR>", "Find files" },
    ['<m-q>'] = { "<cmd>lua require('fzf-lua').live_grep()<CR>", "Live grep" },
    ['Y'] = { "y$", "Yank to end of line" },
    ['<A-left>'] = { "<c-o>", "Jump to previous file" },
    ['<A-right>'] = { "<c-i>", "Jump to next file"},
    ['<leader>z'] = { "Zeavim", "Open documentation in Zeal" },
    ['<m-t>'] = { "<cmd>:NvimTreeFindFileToggle<CR>", "Open tree view" },
    ['<leader>i'] = { "<cmd>:set list!<cr>", "Toggle show/hide invisible chars" },
    ['<leader>u'] = { "<cmd>UndotreeToggle<cr>", "Toggle undo tree" },
    ['<leader>w'] = { "<cmd>lua require('whitespace-nvim').trim()<cr>", "Trim trailing whitespace" },
    ['<leader>b'] = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<cr>", "Toggle blame" },
})

-- Visual mode
which_key.register({
    ['<leader>w'] = { "<cmd>lua require('whitespace-nvim').trim()<cr>", "Trim trailing whitespace" },
}, { mode = "v" })


