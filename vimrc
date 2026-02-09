"========================
"       ~/.vimrc 
"========================

"--- Basic Settings ---
syntax on                     " Enable syntax highlighting
set number                     " Show line numbers
set relativenumber             " Show relative line numbers
set tabstop=4                  " A tab character occupies 4 spaces
set shiftwidth=4               " Indentation commands use 4 spaces
set expandtab                  " Use spaces instead of tabs
set autoindent                 " Copy indent from current line
set smartindent                " Smart auto-indenting
set wrap                        " Wrap long lines
set linebreak                  " Wrap at word boundaries
set scrolloff=3                " Keep 3 lines visible around cursor
set incsearch                  " Incremental search
set hlsearch                   " Highlight search results
set ignorecase                 " Case-insensitive search
set smartcase                  " Case-sensitive if uppercase used
set lazyredraw                 " Faster redraw for big files

"--- Filetype Detection ---
filetype plugin indent on       " Enable filetype detection, plugins, and indenting
au BufRead,BufNewFile *.sh,*.bash,*.zsh set filetype=sh " Ensure shell files get correct syntax

"--- Colors / UI ---
set termguicolors               " True color support
colorscheme evening             " Load evening colorscheme
set ruler                        " Show cursor position
set showmatch                   " Highlight matching brackets
set noshowmode                  " Let statusline show mode instead
set cmdheight=1                 " Command bar height
set mouse=a                     " Enable mouse support
set cursorline                  " Highlight current line

" Highlight trailing whitespace
set list
set listchars=trail:·,tab:»·
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Wrap indicator for long lines
set showbreak=↪

"--- Status Line ---
set laststatus=2                " Always display status line

" Initialize pastel-friendly colors (fallback if .vim_colors not loaded)
if !exists("g:PASTEL_RED")
    let g:PASTEL_RED     = "Red"
    let g:PASTEL_GREEN   = "Green"
    let g:PASTEL_PURPLE  = "Magenta"
    let g:PASTEL_YELLOW  = "Yellow"
    let g:PASTEL_CYAN    = "Cyan"
    let g:PASTEL_ORANGE  = "Orange"
    let g:PASTEL_GREY    = "Grey"
endif

function! ModifiedColor()
    if &mod
        hi statusline guibg=Grey guifg=Orange ctermbg=Red ctermfg=White
    else
        hi statusline guibg=Grey guifg=DarkSlateGray ctermbg=Grey ctermfg=Black
    endif
endfunction

augroup StatuslineColors
    autocmd!
    autocmd InsertLeave,InsertEnter,BufWritePost * call ModifiedColor()
    autocmd VimEnter * call ModifiedColor()
augroup END

" Statusline format: filename, help, readonly
set statusline=%f\ %h\ %r

"--- Navigation ---
" Split navigation shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Example plugin mapping (safe, does nothing if plugin not installed)
if exists(":Files")
    nnoremap <C-p> :Files<CR>
endif

"--- Persistence ---
set hidden                      " Keep buffers hidden when abandoned
set history=1000                 " Command history size
set undofile                     " Persistent undo
let undodir=expand("~/.vim/undo")
if !isdirectory(undodir)
    call mkdir(undodir, "p")
endif

" Backup / swap files
let backupdir=expand("~/.vim/backup//")
let directory=expand("~/.vim/swap//")
if !isdirectory(backupdir)
    call mkdir(backupdir, "p")
endif
if !isdirectory(directory)
    call mkdir(directory, "p")
endif
set backup
set directory^=~/.vim/swap//
set backupdir^=~/.vim/backup//

"========================
" End of ~/.vimrc
"========================
