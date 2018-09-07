set nocompatible
set nopaste
set pastetoggle=<F9>
"Use pathogen.vim : https://github.com/tpope/vim-pathogen
execute pathogen#infect()
"syntax enable
"colorscheme ron
"Setting better yank/paste
nnoremap Y y$
nnoremap p ]p
"Setting space to toggle fold
nnoremap <space> za
"Easier window moving
nnoremap <silent> <C-Right> <C-W><Right>
nnoremap <silent> <C-Left> <C-W><Left>
nnoremap <silent> <C-Up> <C-W><Up>
nnoremap <silent> <C-Down> <C-W><Down>
nnoremap <silent> <C-S-Right> <C-W>L
nnoremap <silent> <C-S-Left> <C-W>H
nnoremap <silent> <C-S-Up> <C-W>K
nnoremap <silent> <C-S-Down> <C-W>J
"Switching from .c to .h (when in same directory) TODO: repolace by a.vim
map <F2> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
"map <silent> <A-s> :split<CR>
"map <silent> <A-v> :vsplit<CR>
"map <silent> <A-h> <C-w><
"map <silent> <A-j> <C-W>-
"map <silent> <A-k> <C-W>+
"map <silent> <A-l> <C-w>>
"Indent/unindent
nnoremap < <<
nnoremap > >>
"Easier moving through functions
nnoremap ( [[
nnoremap ) ]]
"Easier moving in wrapped lines
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"ctrl-space for completion
noremap! <Nul> <C-n>
highlight Pmenu ctermfg=white cterm=bold ctermbg=blue
highlight PmenuSel ctermfg=blue cterm=bold ctermbg=white
"Always show some lines after/before cursor
set scrolloff=5
"set hlsearch
"Setting autocompletion
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete
"Setting folding for all
set foldenable foldmethod=indent foldlevel=99
"autocmd Filetype c set encoding=utf-8
autocmd Filetype c set fileencoding=utf-8
"autocmd Filetype c set encoding=utf-8
autocmd Filetype c match Todo /\\todo/
"autocmd Filetype h set encoding=utf-8
autocmd Filetype h set fileencoding=utf-8
"autocmd Filetype h set encoding=utf-8
autocmd Filetype h match Todo /\\todo/
"Setting indentation
set autoindent smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
"
"Setting terminal title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
  set titleold=""
endif
"Setting statusline
set laststatus=2
set statusline=%t%m\ %{strlen(fugitive#statusline())?fugitive#statusline():'\ '}\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%r%y%=col\ :\ %c,\ line\ :\ %l\ \ [%b\ 0x%B]
"Setting autocompletion in command line
set wildmenu
set wildmode=list:longest
"Set trailing spaces in red, thanks julienro
augroup filetype_set
    autocmd!
    :highlight ExtraWhitespace ctermbg=red guibg=red
    au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
augroup END
