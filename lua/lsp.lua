-- Autocompletion configuration. Be sure to check the project
-- page over at https://github.com/hrsh7th/nvim-cmp/
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- We're using snippy...
			require("snippy").expand_snippet(args.body)
		end,
    },

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
    },

	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			{ name = 'snippy' },
		}, {
			{ name = 'buffer' },
		}
	)
})

  --[[ Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  }) --]]

  --[[-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })]]--

  --[[-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })]]--

-- Setting up LspConfig
local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

-- Let's get the capabilities offered by both the autocomplete
-- engine and NeoVim's LSP client...
local lsp_defaults = lspconfig.util.default_config
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ... and merge them! These capabilities will be passed
-- implicitly to each of the servers we kick off below.
lsp_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_defaults.capabilities,
	cmp_capabilities
)
-- Be sure to check https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- for different server configurations.

-- GoPls
lspconfig.gopls.setup({
	on_attach = function(client, bufnr)
		local maps = vim.keymap.set
		local opts_l = { silent = true, noremap = true }

		maps('n', '<Leader>m', vim.lsp.buf.hover, opts_l)
		maps({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts_l)
	end
})
