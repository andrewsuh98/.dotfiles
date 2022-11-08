local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
	options = {
		mode = "buffers",
		numbers = "none", -- | "ordinal" | "buffer_id" | "both"
		indicator = {
			icon = '▎', -- this should be omitted if indicator style is not 'icon'
			style = 'icon' -- | 'underline' | 'none',
		},
		modified_icon = '●',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = false, -- | "nvim_lsp" | "coc"
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center", -- "left" | "center" | "right"
				separator = true
			}
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = false,
		show_tab_indicators = true,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = "slant", -- | "thick" | "thin" | "slant"
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		hover = {
			enabled = false,
		},
		sort_by = 'id', -- insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' |
		-- highlights = {
		-- fill = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>',
		-- },
		-- background = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- buffer_visible = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- buffer_selected = {
		-- 	-- fg = normal_fg,
		-- 	-- bg = '<colour-value-here>',
		-- 	bold = false,
		-- 	italic = false,
		-- },
		-- tab = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- tab_selected = {
		-- 	fg = '<colour-value-here>',
		-- 	fg = tabline_sel_bg,
		-- 	bg = '<colour-value-here>'
		-- },
		-- tab_close = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- modified = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- modified_visible = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- modified_selected = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- separator_selected = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- separator_visible = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- separator = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- indicator_selected = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>'
		-- },
		-- pick_selected = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>',
		-- 	bold = true,
		-- 	italic = true,
		-- },
		-- pick_visible = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>',
		-- 	bold = true,
		-- 	italic = true,
		-- },
		-- pick = {
		-- 	fg = '<colour-value-here>',
		-- 	bg = '<colour-value-here>',
		-- 	bold = true,
		-- 	italic = true,
		-- },
		-- offset_separator = {
		-- 	fg = win_separator_fg,
		-- 	bg = separator_background_color,
		-- },
		-- }
	}
}
