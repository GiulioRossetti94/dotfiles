

set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim' 		"required
Plugin 'ajh17/VimCompletesMe' 		"vim autocompletion
Plugin 'itchyny/lightline.vim' 		"lightline
Plugin 'tpope/vim-fugitive' 		"fugitive, git plugin
Plugin 'scrooloose/nerdtree' 		"Nerdtree
Plugin 'ryanoasis/vim-devicons' 	"icons nerdtree
Plugin 'skywind3000/asyncrun.vim'   "run terminal commands in vim 
Plugin 'SirVer/ultisnips'           "code snippets  

"Plugin 'daeyun/vim-matlab' 		"matlab editor in nvim it doesn work

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set number relativenumber       " Display line numbers
set title                       " set terminal title to current file name and path
set noshowmode 			" Remove insert line because already in statusline

"#tabs indentds...
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.



syntax enable

let g:python3_host_prog = "/opt/anaconda3/bin/python3"
let g:python_host_prog = "/Users/giulio/.pyenv/versions/neovim2/bin/python"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd VimEnter * call lightline#update()      "solve problem nerdtree lightline not showing up 

let g:lightline = {
      \ 'colorcheme': 'materia',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
set laststatus=2 "always show statuslline

if !has('gui_running')
  set t_Co=256
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

"remap navigate btw splits with Ctrl hjkl

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resizing splits with ctrl + shift + arrow  
noremap <silent> <C-S-Left> :vertical resize +3<CR>
noremap <silent> <C-S-Right> :vertical resize -3<CR>
noremap <silent> <C-S-Up> :resize +3<CR>
noremap <silent> <C-S-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtreee options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd VimEnter * NERDTree | wincmd p      " Start NERDTree and put the cursor back in the other window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif   " Exit Vim if NERDTree is the only window remaining in the only tab.


set guifont=SauceCodePro\ Nerd\ Font:h15
