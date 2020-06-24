if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
	call dein#add('sophacles/vim-processing')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"文字コードをutf-8に変更
set fenc=utf-8
"行番号表示
set number
"現在の行を強調(横)
set cursorline
"行末の一文字先までカーソル移動可に
set virtualedit=onemore
"スマートインデント(謎)
set smartindent
"ビープ音を可視化
set visualbell
"括弧入力時の対括弧可視化
set showmatch
"ステータスラインを表示
set laststatus=2
"コマンドの保管
set wildmode=list:longest
"折り返し時の移動可に
nnoremap j gj
nnoremap k gk
"検索語をハイライト表示
set hlsearch
"escでハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

set wildmenu
set guioptions+=m
set title
set mouse=a
set expandtab
set autoindent
set showcmd
set ruler
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <silent> jj <Esc>
inoremap <silent> っj <ESC>
filetype plugin indent on
set tabstop=4
set shiftwidth=4
