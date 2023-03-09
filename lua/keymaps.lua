-- Check https://neovim.io/doc/user/lua.html#lua-keymap for more info on managing keymaps
-- with Lua. For information on keymaps themselves refer to https://neovim.io/doc/user/map.html.

-- Make the keymap module easier to access!
local keymap = vim.keymap.set

-- Check https://neovim.io/doc/user/api.html#nvim_set_keymap() for more info on
-- options and what each of them do... We'll make keymaps silent by default.
local default_opts = { silent = true }

-- Modes
--   normal_mode       = "n"
--   insert_mode       = "i"
--   visual_mode       = "v"
--   visual_block_mode = "x"
--   term_mode         = "t"
--   command_mode      = "c"

-- Time to move around a bit more easily.
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "k", "gk", default_opts)

-- Make split navigation a bit easier too!
vim.keymap.set("n", "<C-h>", "<C-w>h", default_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", default_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", default_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", default_opts)

-- Make split resizing a bit easier too!
vim.keymap.set("n", "<C-Left>",  ":vertical resize +3<CR>", default_opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", default_opts)
vim.keymap.set("n", "<C-Up>",    ":resize +3<CR>",          default_opts)
vim.keymap.set("n", "<C-Down>",  ":resize -3<CR>",          default_opts)
