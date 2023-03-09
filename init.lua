-- NeoVim's Lua configuration entrypoint. Bear in mind NeoVim's builtin Lua verison
-- is 5.1 as seen by running `:lua print(_VERSION)`. Always refer to this version's
-- reference over at http://www.lua.org/manual/5.1/manual.html for information on
-- Lua itself.

-- Check http://www.lua.org/manual/5.1/manual.html#pdf-require for more info on how
-- we're importing other configuration files through `require()`.

-- General options configured through the `vim.opt` interface as seen on
-- https://neovim.io/doc/user/lua.html#vim.opt. You might also want to refer
-- to https://neovim.io/doc/user/lua.html#lua-vimscript for a bit more of
-- context on the stuff.
require("options")

-- Configure the color scheme. We'll also configure terminal color options
-- such as `termguicolor` and such.
require("colorscheme")

-- Configure keymaps through the `keymap` module. You've got more info within
-- the file itself.
require("keymaps")

-- Time for plugins! We're using Packer as a plugin manager to make stuff a
-- bit easier.
require("plugins")

-- Load plugin-specific configurations
require("lualine")
