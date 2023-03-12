-- Telescope configuration. Be sure to check the project page over
-- at https://github.com/nvim-telescope/telescope.nvim
--
-- Let's make sure Telescope's available before trying to do
-- anything else
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- Let's bind the actions to a local variable: we'll be using it a lot!
local actions = require("telescope.actions")

-- Time to configure Telescope, be sure to check https://github.com/nvim-telescope/telescope.nvim#customization
-- for more information on what to customize.
telescope.setup({
	defaults = {
		-- Let's ignore some folders with no interesting stuff
		file_ignore_patterns = { ".git/" },

		-- Let's add some mappings to make working with the provided
		-- paths a bit easier. They read like NeoVim's keycodes too!
		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"]   = actions.cycle_history_prev,
				["<C-j>"]  = actions.move_selection_next,
				["<C-k>"]  = actions.move_selection_previous
			},
		}
	}
})
