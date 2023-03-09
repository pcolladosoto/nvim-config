-- Configuration for the LuaLine status bar at the bottom of the screen.
-- Be sure to refer to its repo for more interesting info: https://github.com/nvim-lualine/lualine.nvim

-- Let's make sure lualine is available before moving on shall we?
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- Fire up LuaLine and match our current theme. We should think about exposing the colorscheme as
-- a variable for the entire config...

lualine.setup({
	options = {
		theme = "onedark"
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
	}
})

-- TODO: Take a look to see how much of this can be taken advantage of.

--[[
local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = "", warn = "" },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = "foo", modified = "fee", removed = "fii" }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { diagnostics },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { location },
    lualine_z = { "progress" },
  },
}
--]]
