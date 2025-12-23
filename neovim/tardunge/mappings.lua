-------------------------------------------------
-- MAPPINGS
-------------------------------------------------

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>m", "<CMD>NvimTreeToggle<CR>")
map("i", "<leader>m", "<CMD>NvimTreeToggle<CR>")
map("v", "<leader>m", "<CMD>NvimTreeToggle<CR>")

-- Pane Navigation
map("n", "<C-H>", "<C-W><C-H>")
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-Q>", "<C-W>q")
map("n", "<leader>z", '<cmd>lua require("tardunge.functions").toggle_window_zoom()<cr>')

-- Clear last search highlight
map("n", "<esc>", ":noh<return><esc>")

-- Edit and Source Vimrc,tmux,zshrc on the fly
map("n", "<leader>ev", ":vsplit /Users/tardunge/dotfiles/neovim<cr>")
map("n", "<leader>sv", ":Restart<CR>")

-- Disable arrow keys
map("n", "<Left>", ':echoe "Use h"<CR>')
map("n", "<Right>", ':echoe "Use l"<CR>')
map("n", "<Up>", ':echoe "Use k"<CR>')
map("n", "<Down>", ':echoe "Use j"<CR>')

-- Fzf mappings
map("n", "<leader>,", '<cmd>lua require("fzf-lua").files()<CR>')
map("i", "<leader>,", '<esc><cmd>lua require("fzf-lua").files()<CR>')
map("v", "<leader>,", '<esc><cmd>lua require("fzf-lua").files()<CR>')

map("n", "<leader>h", '<cmd>lua require("fzf-lua").oldfiles()<CR>')
map("n", "<leader>b", '<cmd>lua require("fzf-lua").buffers()<CR>')
map("n", "<leader>r", '<cmd>lua require("fzf-lua").grep()<CR>')
map("n", "<leader>rc", '<cmd>lua require("fzf-lua").grep_cword()<CR>')  -- search for word under cursor
map("n", "<leader>rC", '<cmd>lua require("fzf-lua").grep_cWORD()<CR>')  -- search for word under cursor
map("n", "<leader>rb", '<cmd>lua require("fzf-lua").grep_curbuf()<CR>') -- search in current buffer
-- Command needs to be implemented
--map('n', '<leader>w', '<cmd>lua require("fzf-lua").wipeouts()<CR>')

-- LSP mappings
map("n", "<leader>l", ":Mason <CR>")

-- Clipboard mappings

map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- set blackhole register for x and d, so that vim doesn't automatically save the
-- deleted text in the default register.
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("v", "x", '"_x', { noremap = true })
-- dd and p doesn't work.
--vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
--vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true })
