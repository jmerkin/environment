"for pathogen
"filetype off 
call pathogen#helptags()
call pathogen#infect()

"pyflakes
filetype plugin indent on

"for vim-latex
filetype plugin on
set shellslash
" IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


set autoindent "autoindent to parent line's indent level
autocmd BufEnter * :syntax sync fromstart "trying to get it to autosync more frequently
:command S syntax sync fromstart "for when it needs to be resynced for syntax
set nocompatible "apparently vim loses some functionality in oldversions
set number "line number is relative to current position
set undofile "lets you undo more than what you've done since opening
set undodir=~/.vim_undofiles
set showcmd "not sure
set wildmenu "shows menu of tab complete commands
set wildmode=list:longest
set cursorline "underlines current line
set cursorcolumn
"hi cursorline guibg=#333333
"term=reverse ctermbg=1
"guibg=#333333 
	"colors stuff
set copyindent "copies indent of text
set backspace=2 "backspace is normal
set laststatus=2 "not sure
au FocusLost * :wa "saves when window loses focus . ass-saver
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
syntax on

"set smartindent
set tabstop=4 "sets tab length. so is not huge
set softtabstop=4 "sets deletion of indenting to be a tab unit
set shiftwidth=4 "sets autoindent width
set expandtab

set showmatch "shows matching parentheses
set shiftround "use multiple of shiftwidth for indenting with >
set ignorecase "ignore case when searching
set smartcase "ignore case when searching if all lowercase
set hlsearch "highlight search items
set magic "more normal regex
set pastetoggle=<F2> "in insert mode, hit f2 to paste something like normal
set autoread "updates file when modified elsewhere in case you have open and save

setlocal wrap nolist linebreak breakat=\ 
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"nnoremap <C-u> gj
"nnoremap <C-i> gk
					"these make it so you can go down a 'line' if it is wrapped
					"
					"
"so you can type ;w to save and enter commands for stupid typos
nnoremap ; :

"because it's really annoying
noremap <C-a> <C-l> 


"use Q to select or format entire paragraph
vmap Q gq
nmap Q gqap

set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
set scrolljump=5 "cursor jumps x lines when going offscreen
set scrolloff=5 "min number of lines above and below cursor

"cmap W w
"cmap WQ wq
"shift mistakes

"set undo tree key
nnoremap <F5> :GundoToggle<CR>

set iskeyword+=_,$,@,%,#



"so you can be in a method and fold it with :za
set foldmethod=indent
set foldlevel=99
"highlight Folded guibg=blue guifg=blue

let mapleader=","
"can hit ,td to see todo list
map <leader>td <Plug>TaskList

"for gundo
"nnoremap <F5> :GundoToggle<CR>
map <leader>g :GundoToggle<CR>

"don't use quickfix window. not sure what it is
let g:pyflakes_use_quickfix = 0

"see violations across projects
let g:pep8_map='<leader>8'

"supertab
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"dealing with tabs
map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 


" line breaking
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0

nmap <Ctrl-A> <Ctrl-l> " stupid fucking incrementing

"256 color support
set t_Co=256
"colorscheme darkblue
syntax enable
set background=dark
"colorscheme solarized

"highlight SpellBad guifg=#7f0000 guibg=#ffffff guisp=#d6d6d6 

highlight SpellBad      ctermfg=DarkRed         term=Reverse        guisp=DarkRed       gui=undercurl   ctermbg=Green
highlight SpellCap      ctermfg=DarkRed         term=Reverse        guisp=DarkRed     gui=undercurl   ctermbg=Green
highlight SpellLocal    ctermfg=Cyan        term=Underline      guisp=Cyan      gui=undercurl   ctermbg=Green
highlight SpellRare     ctermfg=DarkRed     term=underline      guisp=DarkRed   gui=undercurl   ctermbg=Green

hi CursorLine   cterm=NONE ctermbg=237 guibg=237 guifg=white 
hi CursorColumn cterm=NONE ctermbg=237 guibg=237 guifg=white 
"hi CursorLine   cterm=NONE ctermbg=DarkBlue guibg=DarkBlue guifg=white 
"hi CursorColumn cterm=NONE ctermbg=DarkBlue guibg=DarkBlue guifg=white 
hi Comment guifg=129 guibg=129 ctermfg=129 
hi Visual cterm=NONE ctermbg=238 guibg=238 guifg=white 
hi Search cterm=NONE ctermfg=grey ctermbg=52

"nerdtree shortcut
map <C-n> :NERDTreeToggle<CR>

"so you can move around windows with just C+j etc
let g:BASH_Ctrl_j = 'off'
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

"automatically check vim-flake8 upon writing .py
"autocmd BufWritePost *.py call Flake8()

"flake8 ignore list
let g:flake8_ignore="E302,E265,W291,W202,W293,E201,E203,E202,E128,E123,E126"
let g:flake8_max_line_length=99

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E302,E265,W291,W202,W293,E201,E203,E202,E128,E123,E126 --max-line-length=99'


" R script settings
let maplocalleader = ","
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
"let vimrplugin_applescript=0
let vimrplugin_vsplit=1
let vimrplugin_assign = 0


:inoremap <Esc>Oq 1
:inoremap <Esc>Or 2
:inoremap <Esc>Os 3
:inoremap <Esc>Ot 4
:inoremap <Esc>Ou 5
:inoremap <Esc>Ov 6
:inoremap <Esc>Ow 7
:inoremap <Esc>Ox 8
:inoremap <Esc>Oy 9
:inoremap <Esc>Op 0
:inoremap <Esc>On .
:inoremap <Esc>OQ /
:inoremap <Esc>OR *
:inoremap <Esc>Ol +
:inoremap <Esc>OS -
:inoremap <Esc>OM <Enter>

