" General Settings --------------------------------- {{{

set foldmethod=marker
set foldlevelstart=0

" Status Line --------------------- {{{

set laststatus=2

set statusline=%.20F            " file PATH
set statusline+=\ -\            " Seporator
set statusline+=FileType:       " Label
set statusline+=%y              " Filetype of the file
set statusline+=%=              " Switch to right side
set statusline+=%l              " Current line
set statusline+=/               " Seporator
set statusline+=%c              " Current Column
set statusline+=:               " Seporator
set statusline+=%L              " Total Lines
" }}}

" Disable arrow keys so I stop using them
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
" More stuff here

" Generic file setup
syntax on
filetype plugin indent on
set number
set tabstop=4
set expandtab
set hlsearch incsearch

" Set leader and local leader characters
let mapleader = ","
let maplocalleader = "-"

autocmd BufWritePre * %s/\s\+$//e

" Mark tabs, and trailing whitespace
exec "set listchars=tab:\uBB\uBB,trail:\u2205,nbsp:~"
set list
" }}}

" Language Settings  -------------------------------- {{{

" python file settings --------------------- {{{
augroup python_file
    autocmd!

    " Highlight the 80th character of a file in red
    autocmd FileType python highlight ColorColumn ctermbg=red
    autocmd FileType python call matchadd('ColorColumn', '\%80v', 100)

    " For when I suck at typing
    autocmd FileType python iabbrev improt import

    " Abbreviations
    autocmd FileType python iabbrev rnone return None
augroup END
" }}}

" Setup for html  -------------------- {{{
augroup html_file
    autocmd!

    " Turn off text wrap
    autocmd FileType html setlocal nowrap
augroup END
" }}}
" }}}

" Plugin Settings -------------------------------- {{{

" Run plugins
execute pathogen#infect()

" Settings to help Syntastic run more smoothly
" set statusline+=#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" Custom Keyboard Mappings -------------------------------- {{{

nnoremap <C-f> :NERDTreeToggle<CR>

nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-n> :tabnew<CR>

onoremap in( :<C-u>normal! f(vi(<CR>
onoremap il( :<C-u>normal! F(vi(<CR>
onoremap in" :<C-u>normal! f"vi"<CR>
onoremap il" :<C-u>normal! F"vi"<CR>


" Add new lines without exiting normal mode
nnoremap <leader>r :pu_<CR>
nnoremap <leader>R O<esc>

" Repeat last command
nnoremap <leader>pc @:<CR>

" Clear search highlighting
nnoremap <leader>sh :nohlsearch<CR>

" Automatic 'Very Magic' searches
nnoremap / /\v

" Snippets --------------------- {{{

" HTML
nnoremap <leader>html :-1read $HOME/.vim/snippets/.skeleton_html.html<CR>3jwf>a

" Python
nnoremap <leader>class :-1read $HOME/.vim/snippets/.python_class.py<CR>6li
nnoremap <leader>def :-1read $HOME/.vim/snippets/.python_function.py<CR>4li

"RandText

nnoremap <leader>lorem :-1read $HOME/.vim/snippets/.loremipsum<CR>
" }}}

nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Wrap highlighted text
vnoremap <leader>v" v`<i"<esc>`>a"<esc>
vnoremap <leader>v' v`<i'<esc>`>a'<esc>
" }}}
