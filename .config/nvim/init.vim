" vim:fdm=marker

" GENERAL  ---------------------------------------------------------------- {{{

set tabstop=4 shiftwidth=4 " tab to four spaces
set number relativenumber "relative line numbering
set cursorline " highlight the line of cursor
set noshowmode " don't show mode change, use statusline instead

" ingore case
set ignorecase
set smartcase

" disable mouse
set mouse=

" use system clipboard
set clipboard=unnamedplus

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" use 'kj' as escape
inoremap kj <esc>
vnoremap kj <esc>
cnoremap kj <C-C>

" disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Select all
nnoremap <C-a> gg<S-v>G

" Tabs
nnoremap te :tabedit<Return>
" Split window
nnoremap ss :split<Return><C-w>w
nnoremap sv :vsplit<Return><C-w>w
" Switch focus window
nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
" Resize window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

" automatically install pacakage manager Vim-Plug if absent
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim-Plug configuration
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'EdenEast/nightfox.nvim' " nightfox theme
Plug 'nvim-lualine/lualine.nvim' " statusline
Plug 'L3MON4D3/LuaSnip' " snippet plugin
Plug 'neovim/nvim-lspconfig' " lsp server configs
Plug 'onsails/lspkind.nvim' " vscode-like pictograms
Plug 'hrsh7th/cmp-buffer' " nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-nvim-lsp' " nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' " code completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
call plug#end()

" }}}

" PLUGIN SETTINGS -------------------------------------------------------- {{{

" set colorscheme
colorscheme nordfox " {nightfox, duskfox, nordfox, terafox, carbonfox}

" }}}

" LUA -------------------------------------------------------------------- {{{

lua << EOF
-- lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
	styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff'},
	lualine_c = {'filename'},
	lualine_x = {'diagnostics', 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
	lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- nvim-lsp config
require'lspconfig'.ocamllsp.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- code completion
local cmp = require'cmp'
local lspkind = require 'lspkind'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
  }
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

-- nvim-treesitter configs
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "json",
    "css",
    "html",
    "lua",
	"c_sharp",
	"cpp",
	"gitignore",
	"java",
	"javascript",
	"markdown",
	"markdown_inline",
	"ocaml",
	"ocaml_interface",
	"python",
	"regex",
	"sql",
	"vim"
  },
  autotag = {
    enable = true,
  },
}

-- nvim-autopairs
require("nvim-autopairs").setup {
	disable_filetype = {'vim'}
}

EOF

" }}}
