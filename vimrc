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

" Automatically write when changing buffers
set autowriteall

" Display the match for a search pattern whwn halway typing it
set incsearch

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


"" Plugins
" Automatically install vim-plugin
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"
" Vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Nerdtree
Plug 'preservim/nerdtree'
" Control P
Plug 'ctrlpvim/ctrlp.vim'
" Paper color theme
Plug 'NLKNguyen/papercolor-theme'
" Nerdtree git
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'
" Git for vim
Plug 'tpope/vim-fugitive'
" End of plugins declarations
Plug 'itchyny/lightline.vim'
"
call plug#end()
"" 


" Plugin settings
" NERDTree settings
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
" Show hidden files
let NERDTreeShowHidden=1
" NERDTree shortcuts
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


" CTRLP settings
" Search in current work directory
let g:ctrlp_working_path_mode = 'ra'
"
" Default search is mixed
let g:ctrlp_cmd = 'CtrlPMixed'
"
" Ignore thoses files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }


" Set colorscheme 
set t_Co=256   " This is may or may not needed.

set background=light
colorscheme PaperColor

" Vim-go settings
" Go debuger windows

let g:go_debug_windows = {
			\ 'vars':  'rightbelow 50vnew',
			\ 'out':  'botright 20new',
			\ }
let g:go_gopls_enabled = 0


" Coc configuration
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable"
" delays and poor user experience
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif


" Nerdtree git symbols
let g:NERDTreeGitStatusIndicatorMapCustom = {
			\ 'Modified'  :'M',
			\ 'Staged'    :'S',
			\ 'Untracked' :'U',
			\ 'Renamed'   :'R',
			\ 'Unmerged'  :'═',
			\ 'Deleted'   :'✖',
			\ 'Dirty'     :'M',
			\ 'Ignored'   :'☒',
			\ 'Clean'     :'✔︎',
			\ 'Unknown'   :'?',
			\ }
" Lightline configuration
let g:lightline = {
			\ 'colorscheme': 'PaperColor',
			\ 'active': {
			\   'left': [
			\  		[ 'mode', 'paste' ],
	  	\     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
			\   ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'FugitiveHead'
			\ },
			\ }
