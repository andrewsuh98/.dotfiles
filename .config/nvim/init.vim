" GENERAL  ---------------------------------------------------------------- {{{

set number relativenumber "relative line numbering
set cursorline " highlight the line of cursor
set noshowmode " don't show mode change, using vim-airline instead

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

" STATUS LINE ------------------------------------------------------------ {{{

lua << END
require('lualine').setup()
END

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
