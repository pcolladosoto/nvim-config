-- Treesitter's configuration.
-- Be sure to check the project page for more info and the like over
-- at https://github.com/nvim-treesitter/nvim-treesitter.

-- Make sure treesitter is installed before moving on.
local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

-- We'll also need the configuration, so we might as well bind it
-- to a local variable and check it's available too!
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- Time to configure treesitter.
configs.setup {
	-- Parsers we want to install. We could also set it to the string `"all"` and
	-- get it over with, but we'd rather keep stuff light :)
	ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "go", "c"},
	-- We can also ignore a bunch of languages
	ignore_install = { "" },

	-- We won't be installing language parsers synchronously.
	sync_install = false,

	-- Time to configure highlighting based on the generated syntax trees.
	highlight = {
		-- If set to `false` we would be effectively disabling the whole extension.
		enable = true,

		-- We can avoid highlighting some languages should we want to.
		disable = { "" },
  },

  -- This feature allows us to automatically insert closing tokens such as
  -- a curly brace and such. Enabling this implicitly adds a dependency on
  -- `"windwp/nvim-autopairs"` or some other autopair plugin. We don't really
  -- use these, so let's keep it disabled.
  autopairs = { enable = true },

  -- We want to automatically indent stuff, but we'd rather prevent this from
  -- happening on certain languages such as Python and YAML, for instance.
  indent = {
	  enable = true,
	  disable = { "python", "yaml" }
  }
}
