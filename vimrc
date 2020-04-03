" Beginners .vimrc
" v0.1 2012-10-22 Philip Thrasher
"
" Important things for beginners:
" * Start out small... Don't jam your vimrc full of things you're not ready to
"   immediately use.
" * Read other people's vimrc's.
" * Use a plugin manager for christ's sake! (I highly recommend vundle)
" * Spend time configuring your editor... It's important. Its the tool you
"   spend 8 hours a day crafting your reputation.
" * remap stupid things to new keys that make you more efficient.
" * Don't listen to the haters that complain about using non-default
"   key-bindings. Their argument is weak. I spend most of my time in the editor
"   on my computer, not others, so I don't care if customizing vim means I'll
"   have a harder time using remote vim.
"
" Below I've left some suggestions of good default settings to have in a bare
" minimal vimrc. You only what you want to use, and nothing more. I've heavily
" commented each, and these are what I consider bare necessities, my workflow
" absolutely depends on these things.
"
" If you have any questions, email me at pthrash@me.com

" Setup Vundle:
" For this to work, you must install the vundle plugin manually.
" https://github.com/gmarik/vundle
" To install vundle, copy all the files from the repo into your respective
" folders within ~/.vim
set nocompatible " Fuck VI... That's for grandpas.
set nobackup
set swapfile
set dir=~/tmp
filetype off
let skip_defaults_vim=1
set viminfo=""
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"

set rtp+=~/.vim/bundle/vundle.vim/
"set rtp+=~/.fzf
"n 'itchyny/lightline.vim'set number
call vundle#begin()

" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Plugin 'VundleVim/vundle.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'maximbaz/lightline-ale'

Plugin 'kana/vim-altercmd'
Plugin 'Valloric/YouCompleteMe'
Plugin 'lazywei/vim-matlab'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'lervag/vimtex'

Plugin 'itchyny/lightline.vim'
"let g:ycm_server_python_interpreter='/usr/bin/python2.7'
let g:ycm_server_python_interpreter='/usr/bin/python3.8'
let g:ycm_max_diagnostics_to_display=400

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Plugin 'flazz/vim-colorschemes'

" Fuzzy finder -- absolutely must have.
Plugin 'ctrlpvim/ctrlp.vim'

" Support for easily toggling comments.
Plugin 'tpope/vim-commentary'

"Plugin 'tmhedberg/SimpylFold'

"Plugin 'vim-syntastic/syntastic'

Plugin 'w0rp/ale'

Plugin 'scrooloose/nerdtree'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ryanoasis/vim-devicons'
call vundle#end() 
filetype plugin indent on

" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.


"#let g:ycm_cxx_default_flags = ['-stdlib=libc++']
let g:ycm_autoclose_preview_window_after_insertion = 1
autocmd vimenter * NERDTree
let g:lightline = {}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }


let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

"let g:lightline#ale#indicator_checking = "\uf110"
""let g:lightline#ale#indicator_warnings = "\uf071"
"let g:lightline#ale#indicator_errors = "\uf05e"
"let g:lightline#ale#indicator_ok = "\uf00c"
"let g:lightline#ale#indicator_warnings = <C-v>u<f071>
"<C-v>u<4-digit-unicode>
" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection

let python_highlight_all=1

syntax on " Syntax highlighting

"let g:ale_completion_enabled = 1

let g:ale_linters_explicit = 1
" let g:ale_linters = {'python':['pylint'], 'tex':['chktex','write-good','alex','redpen']}
let g:ale_linters = {'python':['pylint'], 'tex':['chktex']}
let g:ale_python_pylint_options= '--extension-pkg-whitelist=lxml --rcfile=/home/oguz/.config/pylint/.pylintrc'

let g:ale_fixers = ['autopep8', 'yapf']
let g:ale_warn_about_trailing_whitespace = 0

let g:ale_warn_about_trailing_blank_lines = 0
let g:ale_set_highlights = 0
let g:ale_python_flake8_options = '--ignore=E501,E203,E202,E231 --enable-extensions=lxml'
"syntastic beginners settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_quiet_messages = { "type": "style" }
"let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checkers = ['pylint']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.
set encoding=utf-8
" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set number
" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = " "


noremap j gj
noremap k gk


" So we don't have to press shift when we want to get into command mode.
"nnoremap ; :
"vnoremap ; :
"
" map a motion and its reverse motion:

noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

noremap <expr> w repmo#SelfKey('w', 'b')|sunmap w
noremap <expr> b repmo#SelfKey('b', 'w')|sunmap b

noremap <expr> j repmo#SelfKey('j', 'k')|sunmap j
noremap <expr> k repmo#SelfKey('k', 'j')|sunmap k

"if you like `:noremap j gj', you can keep that:
"map <expr> j repmo#Key('gj', 'gk')|sunmap j
"map <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
map <expr> ; repmo#LastKey(';')|sunmap ;
map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;' or `,':
"noremap <expr> f repmo#ZapKey('f')|sunmap f
"noremap <expr> F repmo#ZapKey('F')|sunmap F
"noremap <expr> t repmo#ZapKey('t')|sunmap t
"noremap <expr> T repmo#ZapKey('T')|sunmap T
"noremap <expr> f repmo#ZapKey('f', 1)|sunmap f

noremap <expr> <C-E> repmo#SelfKey('<C-E>', '<C-Y>')
noremap <expr> <C-Y> repmo#SelfKey('<C-Y>', '<C-E>')
" Enable folding
set foldmethod=indent
set foldlevel=99


au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix


map <C-n> :NERDTreeToggle<CR>
map <leader>e :set relativenumber!<CR>

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" go to hpp to cpp 
" nnoremap <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

" Clear match highlighting
noremap <leader>n :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>




" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Map going to the definition of a function to leader b
nnoremap <leader>b <C-]>  

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
"let g:ctrlp_map = '<c-t>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30
let g:ctrlp_regexp = 1


" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
colorscheme seoul256 
filetype plugin on

" " OPTIONAL: This enables automatic indentation as you type.
filetype indent on
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':

let g:tex_flavor='latex'

" let &path.="/home/oguz/Downloads/boost_1_67_0,"
command Make !make -j6 <CR> <CR>
command W w 
command Q q 
command Wq wq 

" Added 19.03.2020
autocmd FileType tex nnoremap <F5> :!pdflatex -interaction=nonstopmode -halt-on-error -synctex=1 %:p<CR><CR>

autocmd FileType python nnoremap <F5> :!python3.7 %:p <CR>
" autocmd FileType python nnoremap <F5> :!python3.7 shellescape(@%, 1)<CR><CR>


command F YcmCompleter FixIt
"let g:ycm_confirm_extra_conf=0
autocmd BufEnter *.m  compiler mlint

"cabbrev make <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Make' : 'make')<CR>
"AlterCommand make Make
"
autocmd FileType matlab map <leader>r :w<CR>:!/usr/local/MATLAB/R2019a/bin/matlab -nodesktop -nosplash -r "try, run %:p, pause, catch, end, quit" <CR> <CR>
" nnoremap <F5> :YcmForceCompileAndDiagnostics <CR>

" Changed 19.03.2020
autocmd FileType c,cpp,hpp,h nnoremap <F10> :YcmDiags <CR>
autocmd FileType c,cpp,hpp,h nnoremap <F4> :YcmCompleter GoToDeclaration<CR>
" autocmd FileType c,cpp,hpp,h nnoremap <F5> :YcmCompleter GoToDefinition<CR>
autocmd FileType c,cpp,hpp,h nnoremap <F6> :YcmCompleter GoToInclude<CR>

" autocmd FileType python nnoremap <buffer> <F9> :exec '!/home/oguz/anaconda3/bin/python' shellescape(@%, 1)<cr>
au BufNewFile,BufRead *.tikz set filetype=tex
set tags=tags;


"clang format"
"map <C-K> :py3f /home/oguz/softwares/clang-format.py style='{BasedOnStyle: LLVM,PointerAlignment: Left}'<cr>
"let g:clang_format_fallback_style="{BasedOnStyle: llvm, PointerAlignment: Left}"
map <C-K> :py3f /home/oguz/softwares/clang-format.py<cr>
imap <C-K><c-o>:py3f /home/oguz/softwares/clang-format.py<cr>

"let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_use_clangd = 0
function! ToggleClangd()
    if g:ycm_use_clangd
        let g:ycm_use_clangd = 0
    else
        let g:ycm_use_clangd = 1
    endif
endfunction

let g:ale_completion_enabled = 1
function! ToggleALeCompletion()
    if g:ale_completion_enabled
        let g:ale_completion_enabled = 0
    else
        let g:ale_completion_enabled = 1
    endif
endfunction

nnoremap <F7> :call ToggleClangd()  <CR>

nnoremap <F2> :call ToggleALeCompletion()  <CR>

" toggle set paste and nopaste
set pastetoggle=<F3>
set gdefault " use the `g` flag by default.
vmap <leader>y :w! /tmp/vitmp<CR> 
nmap <leader>p :r! cat /tmp/vitmp<CR>


autocmd FileType markdown nnoremap <F5> :!pandoc %:p -o %:r.pdf<CR>

" transparency
hi Normal guibg=NONE ctermbg=NONE
set thesaurus+=/home/oguz/.vim/spell/words.txt
autocmd FileType markdown,tex setlocal spell
