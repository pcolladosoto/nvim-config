local set = vim.opt

-- set.nocompatible = true
--
-- Configure the leader key so that it's not the default (i.e. `\`)
-- this is quite useful for mappings! Be sure to check the following
-- for more info https://neovim.io/doc/user/map.html#mapleader.
vim.g.mapleader = ","

set.splitbelow = true
set.splitright = true

set.spell = true
set.spelllang = {"en_gb", "es"}

set.number = true
set.ruler = true

set.encoding = "utf-8"

set.wrap = true

set.ruler = true
set.number = true

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

set.listchars = {eol = "¬", tab = "> ", trail = "~", extends = ">", precedes = "<"}
set.list = true

set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.showmatch = true

set.showmode = true
set.showcmd = true

set.ttyfast = true

set.laststatus = 2

set.hidden = true

set.cursorline = true
