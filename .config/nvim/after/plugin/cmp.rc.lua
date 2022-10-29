local cmp_status, cmp = pcall(require, "cmp")
if (not cmp_status) then return end

local luasnip_status, luasnip = pcall(require, "luasnip")
if (not luasnip_status) then return end

local lspkind_status, lspkind = pcall(require, "lspkind")

-- assist behavior of supertab
local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- custom icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "ﰮ",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "ﬦ",
	TypeParameter = "",
}

-- autocomplete formatting style
local autocomplete_style
if lspkind_status then
	autocomplete_style = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
else
		autocomplete_style = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.kind = string.format('%s %s |', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end
end


cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		}),

		-- supertab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	}),

	-- formatting auto complete
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = autocomplete_style,
	},

	-- cmp sources
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	}),

	-- confirm behavior
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},

	-- documentation window borders
	window = {
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		},
	},

	-- experimental features
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})
