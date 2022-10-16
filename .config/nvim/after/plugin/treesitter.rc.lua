local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
	ensure_installed = {'c', 'c_sharp', 'cmake', 'comment', 'cpp', 'css', 'dockerfile', 'gitignore', 'html', 'http','java', 'javascript', 'jsdoc', 'json', 'json5', 'latex', 'lua', 'make', 'markdown', 'markdown_inline', 'ocaml', 'ocaml_interface', 'python', 'regex', 'rust', 'solidity', 'sql', 'typescript', 'vim'},
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
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- default to all expanded
vim.cmd [[
	autocmd BufReadPost,FileReadPost * normal zR
]]
