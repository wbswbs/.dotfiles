" ##############################################################################
" Plugin config
" ##############################################################################

Bundle "tpope/vim-bundler"
Bundle "vim-ruby/vim-ruby"
Bundle "kchmck/vim-coffee-script"
Bundle "jiangmiao/auto-pairs"
Bundle "tpope/vim-surround"
Bundle "tomtom/tcomment_vim"
Bundle "altercation/vim-colors-solarized"
Bundle "chriskempson/base16-vim"
Bundle "mattn/emmet-vim"
Bundle "tsaleh/vim-matchit"
Bundle "Lokaltog/vim-easymotion"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"
Bundle "vim-scripts/Align"
Bundle "rking/ag.vim"
Bundle "groenewege/vim-less"
" Bundle "shawncplus/php.vim"
" Bundle "joonty/vim-phpunitqf"
" Bundle "joonty/vim-phpqa"


" snippets
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

" ------------------------------------------------------------------------------
Bundle "godlygeek/tabular"
nmap a= :Tabularize /=<CR>
vmap a= :Tabularize /=<CR>
nmap a: :Tabularize /:\zs<CR>
vmap a: :Tabularize /:\zs<CR>


" ------------------------------------------------------------------------------
Bundle "thoughtbot/vim-rspec"

" vim rspec mapping
" let g:rspec_command = "Dispatch zeus rspec {spec}"
let g:rspec_command = "!rspec --drb {spec}"
map <C-t> :call RunCurrentSpecFile()<CR>
map <C-n> :call RunNearestSpec()<CR>
map <C-l> :call RunLastSpec()<CR>
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>

" ------------------------------------------------------------------------------
Bundle "scrooloose/nerdtree"

" let g:NERDTreeWinPos = "right"
noremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> :NERDTreeToggle<CR>


" -----------------------------------------------------------------------------
Bundle "kien/ctrlp.vim"

set wildignore+=*/tmp/*,*/coverage/*

" ------------------------------------------------------------------------------
Bundle "bling/vim-airline"

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_powerline_fonts=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'


" ------------------------------------------------------------------------------
Bundle "unifieddialog/vim-rspec-focus"

nnoremap <leader>f :AddFocusTag<CR>
nnoremap <leader>uf :RemoveAllFocusTags<CR>


" ------------------------------------------------------------------------------
Bundle "tpope/vim-rails"

map <Leader>va :AV<cr>
map <Leader>sa :AS<cr>
map <Leader>vc :RVcontroller<cr>
map <Leader>sc :RScontroller<cr>
map <Leader>vu :RVunittest<CR>
map <Leader>su :RSunittest<CR>
map <Leader>vv :RVview<cr>
map <Leader>sv :RSview<cr>
map <Leader>m :Rmodel<cr>
map <Leader>sm :RSmodel<cr>
map <Leader>vm :RVmodel<cr>

" ------------------------------------------------------------------------------
Bundle "tpope/vim-fugitive"

map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
