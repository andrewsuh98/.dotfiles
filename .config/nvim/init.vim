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

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

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
