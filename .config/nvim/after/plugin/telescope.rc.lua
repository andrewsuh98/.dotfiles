local status, telescope = pcall(require, "telescope")
if (not status) then return end

-- telescope keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>fG', builtin.grep_string, {})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {})

-- theme options: {dropdown, ivy, cursor}
telescope.setup {
	defaults = {
		sorting_strategy = "ascending",
		path_display = { "truncate" },
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				height = 0.9,
				width = 0.9,
				prompt_position = "top",
				mirror = false,
				preview_width = 0.5,
				preview_cutoff = 120
			}
		},
	},
	pickers = {
		-- ...
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		}
	}
}

telescope.load_extension('fzf')
