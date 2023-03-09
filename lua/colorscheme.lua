-- You can find more info on OneDark over at https://github.com/navarasu/onedark.nvim
local colorscheme = "onedark"

-- Configure the plugin...
require(colorscheme).setup({
    style = "cool"
})

-- And load it!
require(colorscheme).load()

-- We'll enable relevant variables for true-color support.
if (vim.call("exists", "+termguicolors")) then
	vim.opt.termguicolors = true
end
