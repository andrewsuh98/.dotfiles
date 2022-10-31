-- bootstrap vim-plug
vim.cmd([[
	let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
	if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif
]])

-- vim-plug configuration
vim.cmd([[
	call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
		Plug 'EdenEast/nightfox.nvim' " nightfox theme
		Plug 'nvim-lualine/lualine.nvim' " statusline
		Plug 'windwp/nvim-autopairs' " autopair
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter for syntax highlighting

		" cmp plugins
		Plug 'hrsh7th/nvim-cmp' " code completion
		Plug 'hrsh7th/cmp-nvim-lsp' " nvim-cmp source for neovim's built-in LSP
		Plug 'hrsh7th/cmp-buffer' " nvim-cmp source for buffer completion
		Plug 'hrsh7th/cmp-path' " nvim-cmp source for path completion
		Plug 'hrsh7th/cmp-cmdline' " nvim-cmp source for cmdline completion

		" snippet engine
		Plug 'L3MON4D3/LuaSnip' " snippet plugin

		" LSP plugins
		Plug 'williamboman/mason.nvim' " LSP package manager
		Plug 'williamboman/mason-lspconfig.nvim' " hook for mason and neovim's LSP
		Plug 'neovim/nvim-lspconfig' " lsp server configs

	call plug#end()
]])
