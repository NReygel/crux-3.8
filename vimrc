"========================
" ~/.vimrc - Optimized Version
"========================

"--- Basic Settings ---
syntax on                      " Enable syntax highlighting
set number                     " Show line numbers
set relativenumber             " Show relative line numbers
set tabstop=4                  " A tab character occupies 4 spaces
set shiftwidth=4               " Indentation commands use 4 spaces
set expandtab                  " Use spaces instead of tab characters
set autoindent                 " Copy indent from current line
set smartindent                " More intelligent auto-indenting
set wrap                       " Wrap long lines
set linebreak                  " Break lines at word boundaries
set scrolloff=3                " Keep 3 lines visible above/below cursor
set incsearch                  " Show partial matches during search
set hlsearch                   " Highlight search matches
set ignorecase                 " Case-insensitive search
set smartcase                  " Case-sensitive search if uppercase used
set lazyredraw                 " Faster redraw for big files

"--- Colors / UI ---
set termguicolors              " Enable true color support
colorscheme evening            " Load 'evening' colorscheme
set ruler                      " Show cursor position in status line
set showmatch                  " Highlight matching brackets
set noshowmode                 " Let statusline display mode instead
set cmdheight=1                " Height of command bar
set mouse=a                    " Enable mouse in all modes
set cursorline                 " Highlight current line

"--- Persistence ---
set hidden                     " Allow buffers to be hidden
set history=1000               " Command history size
set undofile                   " Enable persistent undo
let undodir=expand("~/.vim/undo")
if !isdirectory(undodir)
    call mkdir(undodir, "p")
endif

"--- Status Line ---
set laststatus=2               " Always show status line

" Initialize pastel colors for statusline (GUI and terminal)
" Uses safe defaults if colors not available
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

" Statusline format
set statusline=%f\ %h\ %r             " filename, help flag, read-only flag

"--- Navigation / Plugins ---
" Example: fzf.vim plugin mapping (safe if plugin not installed)
if exists(":Files")
    nnoremap <C-p> :Files<CR>
endif

"--- Backup / Swap / Undo files ---
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
