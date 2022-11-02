local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
	ensure_installed = { 'c', 'c_sharp', 'cmake', 'comment', 'cpp', 'css', 'dockerfile', 'gitignore', 'html', 'http', 'java',
		'javascript', 'jsdoc', 'json', 'json5', 'latex', 'lua', 'make', 'markdown', 'markdown_inline', 'ocaml',
		'ocaml_interface', 'python', 'regex', 'rust', 'solidity', 'sql', 'typescript', 'vim' },
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	}
}

-- enable folding with treesitter
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
	group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
	callback = function()
		vim.opt.foldmethod = 'expr'
		vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
		vim.opt.foldenable = false
	end
})
