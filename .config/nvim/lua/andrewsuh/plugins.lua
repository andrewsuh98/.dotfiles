-- Automatically install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		print "Downloading and installing packer..."
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		print "Packer installed! Close and reopen Neovim..."
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- reload neovim when plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- protected call to prevent error on first use
local status, packer = pcall(require, "packer")
if (not status) then return end

-- packer use floating window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = "rounded" })
		end
	}
}

return packer.startup(function(use)
	use "wbthomason/packer.nvim" -- packer plugin manager
	use "EdenEast/nightfox.nvim" -- nightfox theme
	use "nvim-lualine/lualine.nvim" -- statusline
	use "windwp/nvim-autopairs" -- autopairs
	use "nvim-lua/plenary.nvim" -- plenary
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	} -- treesitter

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- code completion
	use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
	use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer completion
	use "hrsh7th/cmp-path" -- nvim-cmp source for path completion
	use "hrsh7th/cmp-cmdline" -- nvim-cmp source for cmdline completion

	-- snippet engine
	use "L3MON4D3/LuaSnip" -- snippet plugin

	-- LSP plugins
	use "williamboman/mason.nvim" -- LSP package manager
	use "williamboman/mason-lspconfig.nvim" -- hook for mason and neovim's LSP
	use "neovim/nvim-lspconfig" -- lsp server configs

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		}
	}

	-- icon set
	use "nvim-tree/nvim-web-devicons"

	-- file explorer
	use "nvim-tree/nvim-tree.lua"

	-- git
	use "lewis6991/gitsigns.nvim"

	-- which-key
	use "folke/which-key.nvim"

	-- commentor
	use "numToStr/Comment.nvim"

	-- bufferline
	use "akinsho/bufferline.nvim"

	-- Automatically set up configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
