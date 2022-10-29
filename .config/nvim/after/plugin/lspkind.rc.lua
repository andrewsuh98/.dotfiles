local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
	-- defines how annotations are shown
	--
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = 'symbol_text',

	-- default symbol map
	--
	-- default: 'default' (requires nerd-fonts font)
	-- options: 'codicons' (requires vscode-codicons font)
	preset = 'codicons',

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = ""
	},
})
