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
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

" }}}

" PLUGIN SETTINGS -------------------------------------------------------- {{{

" set colorscheme
colorscheme nordfox " {nightfox, duskfox, nordfox, terafox, carbonfox}

" }}}

" LUA -------------------------------------------------------------------- {{{

" lualine configuration
lua << END
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
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {"require'lsp-status'.status()", 'filetype'},
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
END

" }}}
