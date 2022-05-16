call plug#begin('$HOME/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/csscomplete.vim'
Plug 'alvan/vim-closetag'
Plug 'hail2u/vim-css3-syntax'
Plug 'iloginow/vim-stylus'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'cohama/agit.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'zeekay/vim-beautify'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'prettier/vim-prettier'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
call plug#end()
autocmd VimEnter *
\ if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
\ | PlugInstall | q
\ | endif

" Configurações Globais:
syntax on
set number
set autoindent
set incsearch
set hlsearch
set wildmenu
set laststatus=2
set confirm
set wildmode=list:longest
set showbreak=...
set wrap
set mouse=a
set title
set tabstop=4
set ic
set showmatch
set background=dark
set encoding=UTF-8
set cursorline
set clipboard=unnamedplus

" Split
set splitright
set splitbelow

" Auto update
set autoread"

" Themes
source ~/.vim/themes/sonokai.vim
"color elflord

" Novas funções para testar:
"filetype plugin indent on
set shiftwidth=2
set tabstop=2

" Atalhos personalizados:
" Sair
map <S-q> :quit<CR>
" Sair forçado
map <C-q> :quit!<CR>
" Salvar
map <C-s> :w<CR>
" Fecha o buffer atual
map <S-k> :bw<CR>
" Movimentação
nmap <Down> gj
nmap <Up> gk
" Abri o gestor
nnoremap <F8> :NERDTreeToggle <CR>
" imap <expr> <tab> emmet#expandAbbrIntelligent(“\<tab>”)
vnoremap <C-c> "+y<CR>

" Navegação entre os buffers (Alt + setas)
let g:airline#extensions#tabline#formatter = 'default'
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>

" Configurações do AutoCompletar
function AutoCompletar(direcao)
   let posicao = col(".") - 1
   if posicao || getline(".")[posicao - 1] !~ '\k'
      return "\<Tab>"
   elseif a:direcao == "avancar" 
      return "\<C-n>"
   else
      return "\<C-p>"
   endif
endfunction

inoremap <Tab> <C-R>=AutoCompletar("avancar")<CR>
inoremap <S-Tab> <C-R>=AutoCompletar("voltar")<CR>

" Configurações do Airline:
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=0
let g:airline_theme='term'

" Configurações do Emmet-vim:
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags noci
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

" CTRLP.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Indent Guides
let g:indentLine_setColors = 0
"let g:indentLine_char = '-'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
