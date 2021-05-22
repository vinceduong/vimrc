" Line numbers
set number relativenumber

" Syntax coloring
syntax on

" Set tabs to 4
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Display current cursor position
set ruler

" Display incomplete commands
set showcmd

" Display the match for a search pattern whwn halway typing it
set incsearch
set hlsearch

" Jump to matching tags, if/else/endif etc...
packadd! matchit

" Navigate between windows
nnoremap <S-J> <C-W>j
nnoremap <S-K> <C-W>k
nnoremap <S-L> <C-W>l
nnoremap <S-H> <C-W>h

" Search down into subfolders
" Provies tab-completion for all file-related tasks
set path+=**

" dISplay all matching files when we tab complete
set wildmenu

" Prevent vim from chaging directory when opening a file
set noautochdir

" Display buffers and selecting them
nnoremap <F5> :buffers<CR>:buffer<Space>

" Set split to the right
set splitright

"" Netrw configuration
" Tree view 
let g:netrw_liststyle=3

" Disable banner
let g:netrw_banner=0

" Enable file preview
let g:netrw_preview = 1
""

" NERDTree settings
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" NERDTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" CTRLP settings
" Search in current work directory
let g:ctrlp_working_path_mode = 'ra'

" Default search is mixed
let g:ctrlp_cmd = 'CtrlPMixed'

" Ignore thoses files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"" Plugins
" Automatically install vim-plugin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')


" Declare the list of plugins.
" Vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Nerdtree
Plug 'preservim/nerdtree'
" Control P
Plug 'ctrlpvim/ctrlp.vim'
" End of plugins declarations
call plug#end()
"" 
