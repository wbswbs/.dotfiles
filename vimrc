" ========================================================================
" Vundle config
" ========================================================================
  set nocompatible              " be iMproved, required
  filetype off                  " required

" ========================================================================
" Options
" ========================================================================

  let mapleader = ","
  set pastetoggle=<F3>
  set clipboard=unnamedplus   " use the system clipboard
  set backspace=2             " make backspace work like most other apps
  set nobackup                " no backup. Too 70's
  set noswapfile              " no backup. Too 70's
  set cursorline
  " set relativenumber
  set mouse=""                " disable mouse

  " required for several plugins
  set nocompatible

  " enable syntax highlighting
  syntax on

  " don't wrap long lines
  set nowrap

  " show commands as we type them
  set showcmd

  " highlight matching brackets
  set showmatch

  " scroll the window when we get near the edge
  set scrolloff=4 sidescrolloff=10

  " use 2 spaces for tabs
  set expandtab tabstop=2 softtabstop=2 shiftwidth=2
  set smarttab

  " enable line numbers, and don't make them any wider than necessary
  set number numberwidth=2

  " show the first match as search strings are typed
  " set incsearch

  " highlight the search matches
  set hlsearch

  " searching is case insensitive when all lowercase
  set ignorecase smartcase

  " assume the /g flag on substitutions to replace all matches in a line
  " set gdefault

  " set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " pick up external file modifications
  set autoread

  " don't abandon buffers when unloading
  set hidden

  " match indentation of previous line
  set autoindent

  " perform autoindenting based on filetype plugin
  filetype plugin indent on

  " don't blink the cursor
  set guicursor=a:blinkon0

  " show current line info (current/total)
  set ruler rulerformat=%=%l/%L

  " show status line
  set laststatus=2

  " augment status line
  function! ETry(function, ...)
    if exists('*'.a:function)
      return call(a:function, a:000)
    else
      return ''
    endif
  endfunction
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%{ETry('CapsLockStatusline')}%y%{ETry('rails#statusline')}%{ETry('fugitive#statusline')}%#ErrorMsg#%*%=%-16(\ %l,%c-%v\ %)%P

  " When lines are cropped at the screen bottom, show as much as possible
  set display=lastline

  " flip the default split directions to sane ones
  set splitright
  set splitbelow

  " don't beep for errors
  set visualbell

  " make backspace work in insert mode
  set backspace=indent,eol,start

  " highlight trailing whitespace
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set list

  " use tab-complete to see a list of possiblities when entering commands
  set wildmode=list:longest,full

  " allow lots of tabs
  set tabpagemax=20

  " remember last position in file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

  " Thorfile, Rakefile, Vagrantfile, and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

  " hb is handlebars
  au BufNewFile,BufRead *.hb set ai filetype=handlebars

  " hbs is handlebars
  au BufNewFile,BufRead *.hbs set ai filetype=handlebars

  " JSON is JS
  au BufNewFile,BufRead *.json set ai filetype=javascript

  " different color for each paren pairs
  let vimclojure#ParenRainbow = 1

" ========================================================================
" Mappings
" ========================================================================

  " escape alias
  inoremap jj <esc>l

  " buffer changing
  nnoremap <leader>bn :bn<cr>
  nnoremap <leader>bp :bp<cr>

  " closes buffer
  nnoremap <leader>bd :bd<cr>
  nnoremap <leader>bdd :bd!<cr>
  nnoremap <leader>bda :bufdo %bd!<cr>

  " saves from normal mode
  nnoremap <leader>s :w<cr>
  nnoremap <leader>S :w<cr>

  " saves and exits insert mode
  inoremap <leader>s <ESC>:w<cr>
  inoremap <leader>S <ESC>:w<cr>

  " Select all
  nnoremap <C-a> ggVG
  nnoremap <leader>a ggVG
  inoremap <C-a> <ESC>ggVG

  " jumps to the next position after the closest closing char
  inoremap <leader>e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a
  nnoremap <leader>e <Esc>/[\]})"']<cr><Esc>:nohlsearch<cr>a

  " adds arrow
  inoremap <C-l> <Space>=><Space>

  " Ruby old style hashes to new style hashes
  " vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " die hash rockets, die!

  " Rails specific
  nnoremap <Leader>ac :sp app/controllers/application_controller.rb<cr>
  vnoremap <leader>h :s/\:\([a-zA-Z_]\+\)\s\+=>/\=printf("%s:", submatch(1))/g<CR><ESC>:let @/ = ""<CR>
  nnoremap <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>
  nnoremap <Leader>quit <ESC>:q<cr>


  " save and quit Run Ruby, for interactive editor
  nnoremap <Leader>rr <esc>:wq<CR>

  " Open vim rc
  nnoremap <Leader>vim :edit $MYVIMRC<CR>
  nnoremap <Leader>rel :source $MYVIMRC<CR>

  " Fix anoying original K
  nnoremap K <nop>
  nnoremap U <nop>
  inoremap <Esc> <nop>

  " Find
  inoremap <leader>f <ESC>/
  nnoremap <leader>f <ESC>/

  " php specific
  autocmd FileType php inoremap ... ../
  autocmd FileType php inoremap .. ->
  autocmd FileType php inoremap ;; <esc>$a;
  autocmd FileType php set nofoldenable

  " convert file to latin1 and reloads
  nnoremap <leader>lat1 :write ++enc=latin1<cr>:e<cr>

  " Use Q for formatting the current paragraph (or selection)
  vnoremap Q gq
  nnoremap Q gqap

  " clear search
  nnoremap <silent> ,/ :nohlsearch<CR>

  " Avoid arrow keys in command mode
  cnoremap <C-h> <left>
  cnoremap <C-j> <down>
  cnoremap <C-k> <up>
  cnoremap <C-l> <right>
  cnoremap <C-x> <del>

  " Control Ctrl and Ctrl V
  vnoremap <C-c> "+y
  vnoremap <leader>c "+y
  inoremap <C-v> <esc>:set paste<cr>"+p:set nopaste<cr>i
  nnoremap <leader>v :set paste<cr>"+p:set nopaste<cr>i

  " buffer resizing mappings (shift + arrow key)
  nnoremap <Up> <c-w>+
  nnoremap <Down> <c-w>-
  nnoremap <Left> <c-w><
  nnoremap <Right> <c-w>>


  " Trim all trailing whitespaces no questions asked.
  nnoremap <leader>tw :call TrimWhiteSpace()<cr>

  " Tab management
  nnoremap <leader>tn :tabnext<cr>
  nnoremap <leader>tp :tabprev<cr>

  " quotes
  " Single quote word
  nnoremap <leader>sq ciw''<esc><left>p
  " double quote word
  nnoremap <leader>dq ciw""<esc><left>p

" ========================================================================
" Functions
" ========================================================================

  " remove trailing white spaces before saving rb files
  function! TrimWhiteSpace()
  " Save cursor position
    let l = line(".")
    let c = col(".")

    %s/\s\+$//e

  " Restore cursor position
    call cursor(l, c)
  endfunction

" ========================================================================
" Abbreviations
" ========================================================================
  ab phpu PHPUnit_Framework_TestCase
  ab funciton function

" ------------------------------------------------------------------------------
" Allow overriding these settings
" ------------------------------------------------------------------------------
  if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
  endif
