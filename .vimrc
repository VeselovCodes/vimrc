let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" YouCompleteMe
Plug 'ycm-core/YouCompleteMe'

" auto-pairs
Plug 'jiangmiao/auto-pairs'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" navigation
Plug 'kien/ctrlp.vim'
Plug 'exclipy/clang_indexer'
Plug 'ggreer/the_silver_searcher'
Plug 'BurntSushi/ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

syntax on
colorscheme gruvbox
set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
set ruler

set hlsearch
set incsearch

" highlight columns more than colorcolumn symbols
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

" difirinciate c and c++, support doxygen comments
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

let g:clang_auto_select=1
let g:clang_complete_auto=0
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=1
let g:clang_exec="clang"
let g:clang_user_options=""
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_use_library=1
let g:clang_library_path="~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/clang/lib/"
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>

"let g:clic_filename="**/path/to/index.db**"
nnoremap <Leader>r :call ClangGetReferences()<CR>
nnoremap <Leader>d :call ClangGetDeclarations()<CR>
nnoremap <Leader>s :call ClangGetSubclasses()<CR>

" mappings
map <C-n> :NERDTreeToggle<CR>
nnoremap<C-p> :Files<CR>
