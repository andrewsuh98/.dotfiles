" GENERAL  ---------------------------------------------------------------- {{{

set tabstop=4 " tab to four spaces
set showcmd " show command
set number relativenumber "relative line numbering
set cursorline " highlight the line of cursor
set noshowmode " don't show mode change, using vim-airline instead

" highlight search results, ingore case
set incsearch
set hlsearch
set ignorecase
set smartcase

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
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
call plug#end()

" }}}

" PLUGIN SETTINGS -------------------------------------------------------- {{{

" NORD
colorscheme nord

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" AIRLINE
let g:airline_powerline_fonts = 1 " use powerline font
let g:airline_skip_empty_sections = 1 " remove separators for empty sections
let g:airline#extensions#whitespace#enabled = 0 " disable whitespace extension
" let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
" let g:airline_section_a=airline#section#create(['mode', 'crypt', 'paste', 'spell', 'iminsert'])   "mode, crypt, paste, spell, iminsert)
" let g:airline_section_b       (hunks, branch)[*]
" let g:airline_section_c       (bufferline or filename, readonly)
" let g:airline_section_gutter  (csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
let g:airline_section_y=''     "(fileencoding, fileformat, 'bom', 'eol')
let g:airline_section_z='%p%% %l:%c LOC:%L'      "(percentage, line number, column number)
" let g:airline_section_error   (ycm_error_count, syntastic-err, eclim, languageclient_error_count)
" let g:airline_section_warning (ycm_warning_count, syntastic-warn, languageclient_warning_count, whitespace)

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
