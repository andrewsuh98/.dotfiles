local lspconfig_status, nvim_lsp = pcall(require, "lspconfig")
if (not lspconfig_status) then return end

local protocol = require('vim.lsp.protocol')

-- autoformatting per buffer
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
	vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = augroup_format,
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
	})
end

-- global keymaps
local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	-- Mappings.
	local bufopts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)

	-- formatting
	-- buf_set_keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities
local status_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (status_cmp_nvim_lsp) then
	capabilities = cmp_nvim_lsp.default_capabilities()
end

-- python
nvim_lsp.pyright.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

-- ocaml
nvim_lsp.ocamllsp.setup {
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	capabilities = capabilities
}

-- c# with omnisharp
nvim_lsp.omnisharp.setup {
	-- path to omnisharp executable
	cmd = { "dotnet", "/usr/local/bin/omnisharp-roslyn/OmniSharp.dll" },

	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		-- enable_format_on_save(client, bufnr)
	end,
	capabilities = capabilities
}

-- lua
nvim_lsp.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		enable_format_on_save(client, bufnr)
	end,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
			},
		},
	},
}

-- when publishing diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
}
)

-- Diagnostics config
vim.diagnostic.config({
	underline = true,
	update_in_insert = true,
	virtual_text = {
		spacing = 4,
		prefix = '●'
	},
	float = {
		source = "always", -- Or "if_many"
	},
	severity_sort = true
})

---- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end