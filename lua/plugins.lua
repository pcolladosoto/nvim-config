-- Plugin configuration. Note we're relying on Packer to manage plugins and such.
-- You can find tons of information on its repo at https://github.com/wbthomason/packer.nvim.

-- TODO: Translate all the calls to Vim functions to calls to
-- Lua's standard library.

-- This function checks whether Packer is installed. If it's not, it'll clone it
-- into the appropriate directory and then signal the caller so that it can update
-- configuration files and stuff. If Packer's there it will just fall through the
-- end and tell the caller there's nothing to do.
local get_packer = function()
	-- Remember the string concatenation operator is `..` in Lua!
	local install_path = vim.call("stdpath", "data") .. "/site/pack/packer/start/packer.nvim"

	if vim.call("empty", vim.call("glob", install_path)) > 0 then
		vim.call("system", {
			"git", "clone", "--depth", "1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		print("Installing Packer: it wasn't there yet...")

		-- Include the package after cloning the repo!
		vim.cmd("packadd packer.nvim")
		return true
	end
	return false
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file.
-- Be sure to check https://neovim.io/doc/user/autocmd.html for more context
-- on automatic commands and how they work. Bear in mind the `PackerSync`
-- command is offered by Packer itself.
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- Let's see if Packer needs to be installed whilst getting information
-- on what really happened.
local packer_bootstrap = get_packer()

-- Let's check all went well before trying to load Packer. This will prevent
-- some errors and such!
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- At this point we're sure Packer is ready and available. We can configure its
-- overall behaviour by calling `packer.init()`. Be sure to check the following
-- to have a look at available options: https://github.com/wbthomason/packer.nvim#custom-initialization
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end
  }
})

-- Time to define the plugins we want to use.
return require('packer').startup(function(use)
  -- Packer can manage itself :)
	use "wbthomason/packer.nvim"

	use "kyazdani42/nvim-web-devicons"

	use {
		"echasnovski/mini.statusline",
		version = false,
		config = function() require("mini.statusline").setup() end
	}

	-- Treesitter: provides syntax analysis which is used by syntax
	-- highlighting and such-
	use {
		"nvim-treesitter/nvim-treesitter",
		config = function() require("treesitter") end
	}

	-- The Telescope file finder. It requires a some utility
	-- functions provided by `plenary.nvim`.
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.1",
		requires = { "nvim-lua/plenary.nvim" },
		config = function() require("telescope") end
	}

	-- Themes and aesthetics
	use {
		"navarasu/onedark.nvim",
		config = function() require("colorscheme") end
	}
		
	use "folke/tokyonight.nvim"

	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/nvim-cmp"

	use "dcampos/nvim-snippy"
	use "dcampos/cmp-snippy"

	-- Ready made LSP configurations for several servers. Be sure to check
	-- `lsp.lua` for more info and pointers :)
	use {
		"neovim/nvim-lspconfig",
		config = function() require("lsp") end
	}

		use {
		"echasnovski/mini.cursorword",
		config = function() require("mini.cursorword").setup({delay = 100}) end
	}

	use {
		"mhartington/formatter.nvim",
		config = function() require("formatter_conf") end
	}

	-- We'll have to update config files and such if we installed Packer
	-- just now. Otherwise we have little else to do.
	if packer_bootstrap then
		require('packer').sync()
	end
end)
