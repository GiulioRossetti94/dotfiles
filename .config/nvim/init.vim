
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
Plugin 'scrooloose/nerdtree' 		"Nerdtree
Plugin 'ryanoasis/vim-devicons' 	"icons nerdtree
Plugin 'skywind3000/asyncrun.vim'   "run terminal commands in vim 
Plugin 'SirVer/ultisnips'           "code snippets  
Plugin 'honza/vim-snippets'         "lets try these snippets firts dont need most of them
Plugin 'lervag/vimtex'              "latex plugin
Plugin 'numToStr/Comment'           " 'gc' to comment visual region/lines

" Git plugins
Plugin 'tpope/vim-fugitive' 		"fugitive, git plugin
Plugin 'tpope/vim-rhubarb'
"telescope: fuzzy finder
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-lua/telescope.nvim'
Plugin 'kyazdani42/nvim-web-devicons'  "icons for telescope
"lua autocompletion

Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
"Plugin 'hrsh7th/cmp-cmdline'
Plugin 'hrsh7th/nvim-cmp'
Plugin 'quangnguyen30192/cmp-nvim-ultisnips'

"neovim color plugin
"Plugin 'rebelot/kanagawa.nvim'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set number relativenumber       " Display line numbers
set title                       " Set terminal title to current file name and path
set noshowmode 			        " Remove insert line because already in statusline
set mouse=a                     " Allow mouse
"#tabs indentds...
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.


let mapleader=","
"set spell check only on tex file
"spell check
"setlocal spell
"set spelllang =en,it
"spell check: Ctrl+l correct previous spelling mistake
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u



syntax enable
let g:python3_host_prog = "/opt/anaconda3/bin/python3"
let g:python_host_prog = "/Users/giulio/.pyenv/versions/neovim2/bin/python"
let g:tex_flavor = "latex"      " set tex type so that no plaintex.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
" => Utilsnip settings: how to trigger snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<C-t>"
"let g:UltiSnipsJumpForwardTrigger="<C-f>"
"let g:UltiSnipsJumpBackwardTrigger="<C-b>"
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-h>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]  "custom snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>
" Remove whitespace
nnoremap <leader>sws :%s/\s\+$//<CR>
"write only if something is changed
noremap <leader>w :up<cr>
"serach and replace in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => running commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType julia map <buffer> <F9> :w<CR>:exec '!julia' shellescape(@%, 1)<CR>
autocmd FileType julia imap <buffer> <F9> <esc>:w<CR>:exec '!julia' shellescape(@%, 1)<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

"remap navigate btw splits with Ctrl hjkl
nnoremap <s-h> <C-w>h
nnoremap <s-j> <C-w>j
nnoremap <s-k> <C-w>k
nnoremap <s-l> <C-w>l

" resizing splits with ctrl + shift + arrow  
noremap <silent> <C-S-Left> :vertical resize +3<CR>
noremap <silent> <C-S-Right> :vertical resize -3<CR>
noremap <silent> <C-S-Up> :resize +3<CR>
noremap <silent> <C-S-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

"vertical and horizontal splits
noremap vs :vsplit
noremap hs :split

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtreee options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

",n to open nerdtree
map ,n :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree | wincmd p      " Start NERDTree and put the cursor back in the other window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif   " Exit Vim if NERDTree is the only window remaining in the only tab.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Latex specific settings  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"show Unicode symbols in normal mode

"set conceallevel=1
"set concealcursor=nvc
"let g:tex_conceal="adgms"
let g:vimtex_view_method='skim'
"let g:Tex_ViewRule_pdf = 'skim'


"space t for tex file put template in it
nnoremap <space>t :-1read $HOME/.vim/templates/skeleton.tex<CR>/{<CR>o

"Ctrl + shift + t to compile a tex file
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf -pv %<CR>   

"inverse search for nvim and skim 
"https://jdhao.github.io/2021/02/20/inverse_search_setup_neovim_vimtex/

function! SetServerName()
  if has('win32')
    let nvim_server_file = $TEMP . "/curnvimserver.txt"
  else
    let nvim_server_file = "/tmp/curnvimserver.txt"
  endif
  let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
  call system(cmd)
endfunction


augroup vimtex_common
    autocmd!
    autocmd FileType tex call SetServerName()
augroup END
"insert a tab or expands autocompletion according to the context
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

set guifont=SauceCodePro\ Nerd\ Font:h18

"colorscheme kanagawa
""""""""""""""""""""""""""""""""""""""
"  LUA setup lets try if it works
""""""""""""""""""""""""""""""""""""""
"lua require('basic')  "example. call lua fila and print something every time
"it is reloaded
lua require('init')

"remap for telescope

"ctrl / for telescope find
"nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top <cr> 
"nnoremap <C-_> <cmd> lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", prompt_position="top"}) <cr>
"nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending", prompt_position="top"})<cr>
"nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({sorting="ascending",prompt_position="bottom"}))<cr>

nnoremap <C-_> <cmd>lua require("init").curr_buf() <cr>
nnoremap <F4> :lua package.loaded.init = nil <cr>:source ~/.config/nvim/init.vim <cr>
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>? :Telescope oldfiles<cr>


