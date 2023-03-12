-- Code Formatter. Be sure to check the project page over at
-- https://github.com/mhartington/formatter.nvim for more info.
local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands.
formatter.setup({
	-- Enable or disable logging
	logging = false,

	-- Set the log level
	log_level = vim.log.levels.WARN,

	-- All formatter configurations are opt-in
	filetype = {
		go = {
			-- Format the code as a whole
			require("formatter.filetypes.go").gofmt,

			-- Order the imports
			require("formatter.filetypes.go").goimports
		}
	},

	-- Do stuff on every filetype
	["*"] = {
		-- Note `formatter.filetypes.any` contains goodies applicable to every
		-- language. The following one uses `swd`, for instance.
		require("formatter.filetypes.any").remove_trailing_whitespace
	}
})
