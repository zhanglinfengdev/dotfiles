  "noremap J 3j
  "noremap K 3k
 "map 
""" Python3 VirtualEnv
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

set autoindent
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

    " map f <Plug>Sneak_f
    " map F <Plug>Sneak_F
    " map t <Plug>Sneak_t
    " map T <Plug>Sneak_T
    
"set mouse=a
set encoding=utf-8
let &t_ut=''
"set list
"
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
elseif empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
au WinEnter    * set cursorline
au WinLeave    * set nocursorline
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

set t_Co=256
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" iset smarttab
set autoindent
set ignorecase
set smartcase
set ch=2
set vb
set backspace=2
" set hidden
set cpoptions=ces$
set laststatus=2
set lazyredraw
set showcmd
set showmode
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175


"set laststatus=2
set autochdir
set wrap
"set showcmd
set wildmenu
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic — @amix3k
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
" let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


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

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

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


exec "nohlsearch"

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

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    " colorscheme desert
catch
endtry

" set background=dark

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
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


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


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    exe "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"syntax on
set number
set cursorline
set scrolloff=10

call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    "Plug 'flazz/vim-colorschemes'
    " Plug 'altercation/vim-colors-solarized'
    " Plug 'valloric/youcompleteme'
    Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
     Plug 'morhetz/gruvbox'
"    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
    Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
    "Plug 'vimwiki/vimwiki'
    " Git
    Plug 'rhysd/conflict-marker.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'machakann/vim-highlightedyank'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'
    Plug 'godlygeek/tabular' "???? (Markdown ???????), ????? Markdown ????
    "Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'} " Markdown ????   
    Plug 'easymotion/vim-easymotion'
    Plug 'tpope/vim-surround'
    " Plug 'terryma/vim-multiple-cursors'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'tpope/vim-commentary'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'tommcdo/vim-exchange'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'kana/vim-textobj-user'
    Plug 'mhinz/vim-startify'
    Plug 'Yggdroot/indentLine'
     "if has('nvim')
         "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
     "else
         "Plug 'Shougo/deoplete.nvim'
         "Plug 'roxma/nvim-yarp'
         "Plug 'roxma/vim-hug-neovim-rpc'
     "endif

    " use release branch (recommend)
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    " Plug 'justinmk/vim-sneak'
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
    Plug 'kana/vim-textobj-entire'
    Plug 'dbakker/vim-paragraph-motion'
    Plug 'michaeljsmith/vim-indent-object'

    " Track the engine.
    " Plug 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    " Plug 'honza/vim-snippets'
    Plug 'ron-rs/ron.vim'
    Plug 'vim-autoformat/vim-autoformat'
call plug#end()

let g:python3_host_prog="/usr/local/bin/python3"
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

" " Read ~/.NERDTreeBookmarks file and takes its second column
" function! s:nerdtreeBookmarks()
"     let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
"     let bookmarks = bookmarks[0:-2] " Slices an empty last line
"     return map(bookmarks, "{'line': v:val, 'path': v:val}")
" endfunction

" let g:startify_lists = [
"         \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
"         \]
" autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()
" function! GetUniqueSessionName()
"   let path = fnamemodify(getcwd(), ':~:t')
"   let path = empty(path) ? 'no-project' : path
"   let branch = gitbranch#name()
"   let branch = empty(branch) ? '' : '-' . branch
"   return substitute(path . branch, '/', '-', 'g')
" endfunction






 filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 0
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1

    " let g:sneak#label = 1
    "let g:deoplete#enable_at_startup = 1
    set updatetime=100
"let g:multi_cursor_use_default_mapping=0

" default mapping
"let g:multi_cursor_start_word_key      = '<c-n>'
"let g:multi_cursor_select_all_word_key = '<a-n>'
"let g:multi_cursor_start_key           = 'g<c-n>'
"let g:multi_cursor_select_all_key      = 'g<a-n>'
"let g:multi_cursor_next_key            = '<c-n>'
"let g:multi_cursor_prev_key            = '<c-p>'
"let g:multi_cursor_skip_key            = '<c-x>'
"let g:multi_cursor_quit_key            = '<esc>'

"easymotion 
nmap <leader><leader>s <plug>(easymotion-s2)

" vim airline/airline-theme set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer
" let g:airline_theme='solarized'  " murmur配色不错
let g:airline_theme='gruvbox'  " murmur配色不错
 
 
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
 " let g:airline_left_sep = '▶'
 let g:airline_left_alt_sep = '❯'
 " let g:airline_right_sep = '◀'
 let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '





" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"代码注释preservim/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1 " Use compact syntax for prettified multi-line comments let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


"autocmd VimEnter * NERDTree
colorscheme gruvbox
syntax enable
set background=dark


command! -bang -nargs=* Rg
             \ call fzf#vim#grep(
             \ "rg --column --line-number --no-heading --color=always --smart-case --hidden -g '!**/.git/**' -- ".shellescape(<q-args>), 1, <bang>0)

" --hidden: ??????
"   -g '!**/.git/**': ????.git???
"
"
"
"
"






















"
"
 """ TextEdit might fail if hidden is not set.
 "set hidden
 "
 "" Some servers have issues with backup files, see #649.
 "set nobackup
 "set nowritebackup
 "
 "" Give more space for displaying messages.
 "set cmdheight=2
 "
 "" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
 "" delays and poor user experience.
 "set updatetime=300
 "
 "" Don't pass messages to |ins-completion-menu|.
 "set shortmess+=c
 "
 "" Always show the signcolumn, otherwise it would shift the text each time
 "" diagnostics appear/become resolved.
 "if has("patch-8.1.1564")
   "" Recently vim can merge signcolumn and number column into one
   "set signcolumn=number
 "else
   "set signcolumn=yes
 "endif
 "
 "" Use tab for trigger completion with characters ahead and navigate.
 "" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
 "" other plugin before putting this into your config.
 "inoremap <silent><expr> <TAB>
       "\ pumvisible() ? "\<C-n>" :
       "\ <SID>check_back_space() ? "\<TAB>" :
       "\ coc#refresh()
 "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 "
 "function! s:check_back_space() abort
   "let col = col('.') - 1
   "return !col || getline('.')[col - 1]  =~# '\s'
 "endfunction
 "
 "" Use <c-space> to trigger completion.
 "if has('nvim')
   "inoremap <silent><expr> <c-space> coc#refresh()
 "else
   "inoremap <silent><expr> <c-@> coc#refresh()
 "endif
 "
 "" Make <CR> auto-select the first completion item and notify coc.nvim to
 "" format on enter, <cr> could be remapped by other vim plugin
 "inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
 "
 "" Use `[g` and `]g` to navigate diagnostics
 "" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
 "nmap <silent> [g <Plug>(coc-diagnostic-prev)
 "nmap <silent> ]g <Plug>(coc-diagnostic-next)
 "
 "" GoTo code navigation.
 "nmap <silent> gd <Plug>(coc-definition)
 "nmap <silent> gy <Plug>(coc-type-definition)
 "nmap <silent> gi <Plug>(coc-implementation)
 "nmap <silent> gr <Plug>(coc-references)
 "
 "" Use K to show documentation in preview window.
 "nnoremap <silent> K :call <SID>show_documentation()<CR>
 "
 "function! s:show_documentation()
   "if (index(['vim','help'], &filetype) >= 0)
     "execute 'h '.expand('<cword>')
   "elseif (coc#rpc#ready())
     "call CocActionAsync('doHover')
   "else
     "execute '!' . &keywordprg . " " . expand('<cword>')
   "endif
 "endfunction
 "
 "" Highlight the symbol and its references when holding the cursor.
 "autocmd CursorHold * silent call CocActionAsync('highlight')
 "
 "" Symbol renaming.
 "nmap <leader>rn <Plug>(coc-rename)
 "
 "" Formatting selected code.
 "xmap <leader>f  <Plug>(coc-format-selected)
 "nmap <leader>f  <Plug>(coc-format-selected)
 "
 "augroup mygroup
   "autocmd!
   "" Setup formatexpr specified filetype(s).
   "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
   "" Update signature help on jump placeholder.
   "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
 "augroup end
 "
 "" Applying codeAction to the selected region.
 "" Example: `<leader>aap` for current paragraph
 "xmap <leader>a  <Plug>(coc-codeaction-selected)
 "nmap <leader>a  <Plug>(coc-codeaction-selected)
 "
 "" Remap keys for applying codeAction to the current buffer.
 "nmap <leader>ac  <Plug>(coc-codeaction)
 "" Apply AutoFix to problem on the current line.
 "nmap <leader>qf  <Plug>(coc-fix-current)
 "
 "" Map function and class text objects
 "" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
 "xmap if <Plug>(coc-funcobj-i)
 "omap if <Plug>(coc-funcobj-i)
 "xmap af <Plug>(coc-funcobj-a)
 "omap af <Plug>(coc-funcobj-a)
 "xmap ic <Plug>(coc-classobj-i)
 "omap ic <Plug>(coc-classobj-i)
 "xmap ac <Plug>(coc-classobj-a)
 "omap ac <Plug>(coc-classobj-a)
 "
 "" Remap <C-f> and <C-b> for scroll float windows/popups.
 "" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
 "nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 "nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 "inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
 "inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
 "
 "" NeoVim-only mapping for visual mode scroll
 "" Useful on signatureHelp after jump placeholder of snippet expansion
 "if has('nvim')
   "vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
   "vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
 "endif
 "
 "" Use CTRL-S for selections ranges.
 "" Requires 'textDocument/selectionRange' support of language server.
 "nmap <silent> <C-s> <Plug>(coc-range-select)
 "xmap <silent> <C-s> <Plug>(coc-range-select)
 "
 "" Add `:Format` command to format current buffer.
 "command! -nargs=0 Format :call CocAction('format')
 "
 "" Add `:Fold` command to fold current buffer.
 "command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 "
 "" Add `:OR` command for organize imports of the current buffer.
 "command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 "
 "" Add (Neo)Vim's native statusline support.
 "" NOTE: Please see `:h coc-status` for integrations with external plugins that
 "" provide custom statusline: lightline.vim, vim-airline.
 "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
 "
 "" Mappings for CoCList
 "" Show all diagnostics.
 "nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
 "" Manage extensions.
 "nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
 "" Show commands.
 "nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
 "" Find symbol of current document.
 "nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
 "" Search workspace symbols.
 "nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
 "" Do default action for next item.
 "nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
 "" Do default action for previous item.
 "nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
 "" Resume latest coc list.
 "nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
 ""
 ""
 ""
" ??`^?????????????
" inoremap jk <Esc>
" vnoremap jk <Esc>
" nnoremap 0 ^
" 鼠标暂不启用
set mouse-=a
" 启用鼠标 
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide
"==========================================
" Display Settings ??/?????????
"==========================================

" 显示当前行号列号
set ruler
" 在状态栏显示正在输入命令
set showcmd
" 左下角显示当前vim模式
set showmode






" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
imap <silent> <D-k> _
imap <silent> <D-d> _
imap <silent> <D-K> -
imap <silent> <D-D> -

" Change inside various enclosures with Cmd-" and Cmd-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <D-'> f'ci'
nnoremap <D-"> f"ci"
nnoremap <D-(> f(ci(
nnoremap <D-)> f)ci)
nnoremap <D-[> f[ci[
nnoremap <D-]> f]ci]

" ==== NERD tree
" Cmd-Shift-N for nerd tree
nmap <D-N> :NERDTreeToggle<CR>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {
autocmd FileType javascript map <buffer> <D-k> }
autocmd FileType javascript map <buffer> <D-j> {

" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

" ============================
" Tabularize - alignment
" ============================
" Hit Cmd-Shift-A then type a character you want to align by
nmap <D-A> :Tabularize /
vmap <D-A> :Tabularize /

" Source current file Cmd-% (good for vim development)
map <D-%> :so %<CR>
