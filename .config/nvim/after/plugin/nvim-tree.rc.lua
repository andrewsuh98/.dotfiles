local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

-- keymap to toggle nvim-tree
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<Leader>E', ':NvimTreeFocus<CR>', opts)

local mappings = {
	{ key = { "<CR>", "o", "<2-LeftMouse>", "l" }, action = "edit" },
	{ key = { "<BS>", "h" }, action = "close_node" },
	{ key = "sv", action = "vsplit" },
	{ key = "ss", action = "split" },
	{ key = "r", action = "full_rename" },
	{ key = "[d", action = "prev_diag_item" },
	{ key = "[g", action = "prev_git_item" },
	{ key = "]d", action = "next_diag_item" },
	{ key = "]g", action = "next_git_item" },
	{ key = "<C-i>", action = "toggle_file_info" },
	-- { key = "s", action = "system_open" },
}

nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	sort_by = "case_sensitive", -- options: {'name', 'case_sensitive', 'modification_time', 'extension'}
	remove_keymaps = { "s" },
	view = {
		mappings = {
			custom_only = false,
			list = mappings,
		},
	},
	filters = {
		-- custom = { "^.git$" }
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			}
		}
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	renderer = {
		add_trailing = true,
		highlight_git = true,
		highlight_opened_files = "none", -- options: {'none', 'icon', 'name', 'all'}
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
}
