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
    call dein#add('preservim/nerdtree')
    call dein#add('tpope/vim-fugitive')
    call dein#add('Shougo/neocomplete')
    call dein#add('Shougo/neosnippet')
    call dein#add('tomtom/tcomment_vim')
    call dein#add('tpope/vim-surround')
    call dein#add('t9md/vim-textmanip')
    call dein#add('osyo-manga/vim-watchdogs')
    call dein#add('Shougo/neosnippet-snippets')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
 " Use smartcase.
let g:neocomplete#enable_smart_case = 1
 " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

 " Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
         \ }

"efine keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
                         endif
                         let g:neocomplete#keyword_patterns['default'] ='\h\w*'
                         " Plugin key-mappings.
                         inoremap <expr> <C-g> neocomplete#undo_completion()
                         inoremap <expr> <C-l> neocomplete#complete_common_string()
                         " Recommended key-mappings.
                         " <CR>: close popup and save indent.
                         inoremap <silent> <CR> <C-r> = <SID>my_cr_function()<CR>
                         function! s:my_cr_function()
                           return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
   endfunction
   " <TAB>: completion.
   inoremap <expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
   " <C-h>, <BS>: close popup and delete backword char.
   inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
   inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
  "   " Close popup by <Space>.
     "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
  "
  "   " AutoComplPop like behavior.
  "   "let g:neocomplete#enable_auto_select = 1
  "
  "   " Shell like behavior(not recommended).
  "   "set completeopt+=longest
  "   "let g:neocomplete#enable_auto_select = 1
  "   "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
 
    " Enable omni completion.
   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 
    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
      endif
     let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
     let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
     let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

     " For perlomni.vim setting.
     " https://github.com/c9s/perlomni.vim
     let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"snippets
"n key-mappings.
"Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k> <Plug> (neosnippet_expand_or_jump)
smap <C-k> <Plug> (neosnippet_expand_or_jump)
xmap <C-k> <Plug> (neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr> <TAB> neosnippet#expandable_or_jumpable() ?
"\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
     
      " For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
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
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
