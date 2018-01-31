""""""""""""""""""""""""
" Vim config           "
" ~/.vimrc and ~/.vim/ "
""""""""""""""""""""""""

" Start of Vundle.vim
" Needs to be at the beging
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'matchit.zip'
"
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'vim-scripts/xoria256.vim'
"Plugin 'vim-scripts/pyte'
"Plugin 'vim-scripts/mayansmoke'
"Plugin 'vim-scripts/summerfruit.vim'
"Plugin 'vim-scripts/seoul256.vim'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'vim-scripts/gruvbox'
Plugin 'vim-scripts/hemisu.vim'
Plugin 'theelones/donotbotherme.vim'

call vundle#end()
" End of Vundle.vim

" Fitetype configuration
filetype on
filetype plugin on
filetype indent off
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab



" Edit the ~/.vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Show/Hide list, i.e., invisibles
nmap <leader>l :set list!<CR>

" Set fancy invisibles for gui
set listchars=tab:▸\ ,eol:¬

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input("set tabstop = softtabstop = shiftwidth = ")
  if l:tabstop > 0
    set noexpandtab
    retab!
    let &l:tabstop = l:tabstop
    let &l:softtabstop = l:tabstop
    let &l:shiftwidth = l:tabstop
  else
    let &l:tabstop = 2
    let &l:softtabstop = 2
    let &l:shiftwidth = 2
    set expandtab
    retab
  endif
  call SummarizeTabs()
endfunction
function! SummarizeTabs()
  try
    echo  "\n"
    echohl ModeMsg
    echon "tabstop="&l:tabstop
    echon " softtabstop="&l:softtabstop
    echon " shiftwidth="&l:shiftwidth
    if &l:expandtab
      echon " expandtab"
    else
      echon " noexpandtab"
    endif
  finally
    echohl None
  endtry
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""


" Start of syntax
if !exists("g:syntax_on")
    syntax enable
endif

:map <F7> :if exists("g:syntax_on") <Bar>
        \    syntax off <Bar>
        \  else <Bar>
        \    syntax enable <Bar>
        \  endif <CR>
" End of syntax

set ruler
set showmode
set showcmd
set cursorline
set nocursorcolumn
set wildmenu

set laststatus=2
set history=1000

set statusline=
set statusline+=[%f]
set statusline+=[%n]
set statusline+=%y
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%=
set statusline+=[%l,%c/%L]
set statusline+=[%p/%P]

set number
set relativenumber
set novisualbell

set wrap
set showbreak=+
set linebreak
set sidescroll=10
set scrolloff=1

set hlsearch
set noincsearch
set ignorecase
set smartcase
"set wrapscan

set backspace=2
set showmatch
set nojoinspaces
set lazyredraw

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set nobackup
set nowritebackup
set noswapfile

colorscheme donotbotherme


" Start of vimwiki
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'path_html': '~/Documents/vimwiki/html/'}]
" End of vimwiki

set clipboard+=unnamed
set paste
