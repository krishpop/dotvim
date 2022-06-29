"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Row number and ruler
set number relativenumber
set colorcolumn=88

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Pathogen
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=**-checkpoint.py
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Ignores vi-compatiblity
set nocompatible

" Enable fuzzyfinding
set path+=**
set wildignore+=**/.ipynb_checkpoints/**

" Folding color
hi Folded ctermfg=Black
hi Folded ctermbg=DarkGrey
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => TAGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" create tags file
command! MakeTags !ctags -R . --exclude='**.ipynb_checkpoints/'

" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AUTOCOMPLETE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" documented in |ins-completion|

" Highlights:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with path trick)
" - ^x^] for tags only
" - ^n for anything specified by the complete option

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" colorscheme
try
    let g:seoul256_background = 234
    let g:seoul256_light_background = 256
    " colo seoul256-light
catch
endtry

" Werewolf plugin to change day/night themes
"let g:werewolf_day_themes = ['seoul256-light', 'peachpuff']
"let g:werewolf_night_themes = ['seoul256', 'palenight']

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
set undodir=~/.vim/tmp/undodir
set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Natural split opening
set splitbelow
set splitright

set clipboard=unnamed
vnoremap <C-c> "+y

set mouse=a

nnoremap <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Header
" https://github.com/alpertuna/vim-header
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:header_field_author = 'Krishnan Srinivasan'
let g:header_field_author_email = 'krishnan1994 at gmail'
let g:header_field_modified_by = 0
let g:header_auto_add_header = 0
map <leader>h :AddHeader<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python Syntax
" https://github.com/vim-python/python-syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Jedi Vim
" https://github.com/davidhalter/jedi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = "2"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDtree
" https://github.com/scrooloose/nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<CR>

function! ToggleNERDTree()
    NERDTreeToggle
    silent NERDTreeMirror
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Next Buffer Shortcut
" http://vim.wikia.com/wiki/Cycle_through_buffers_including_hidden_buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! SwitchToNextBuffer(incr)
  let help_buffer = (&filetype == 'help')
  let current = bufnr("%")
  let last = bufnr("$")
  let new = current + a:incr
  while 1
    if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
      execute ":buffer ".new
      break
    else
      let new = new + a:incr
      if new < 1
        let new = last
      elseif new > last
        let new = 1
      endif
      if new == current
        break
      endif
    endif
  endwhile
endfunction
nnoremap <silent> <C-n> :call SwitchToNextBuffer(1)<CR>
nnoremap <silent> <C-p> :call SwitchToNextBuffer(-1)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
" https://github.com/dense-analysis/ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_linters = {
            \   'python': ['flake8'],
\}   " flake8, pydocstyle, bandit, mypy
let g:ale_fixers = {
            \   'python': ['black'],
            \   '*': ['remove_trailing_lines', 'trim_whitespace']
\}
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1

" Normal mode, jump to next and previous error
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pydiction
" https://vimawesome.com/plugin/pydiction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:pydiction_location = "~/.vim/bundle/pydiction/complete-dict"
let g:pydiction_menu_height = 5

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimairline
" https://github.com/vim-airline/vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
