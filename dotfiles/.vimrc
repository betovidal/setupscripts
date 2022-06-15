" Boostraped from - https://www.youtube.com/watch?v=XA2WjJbmmoM
" and vim-sensible
" Check if I want this https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim
" https://github.com/prabirshrestha/vim-lsp/wiki/Servers
" Install vim-plug through:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
packadd matchit             " Match opening/closing html,xml tags with *
" vim-lsp to show documentation in a floating something, not a preview window
set completeopt-=preview
filetype plugin indent on   " https://vi.stackexchange.com/a/10125
set nocompatible            " Do not pretend to be vi, enable new features
let mapleader=","           " To add more functionality, instead of \
filetype plugin on          " Enable netwr
set modeline                " Enable syntax hightlighting through modeline magic. See more with :help modeline
set wildignore+=**/node_modules/**,**/__pycache__/** " Do not consider folders in :find
set encoding=utf-8
set wildmenu                " Display all matching files when we tab complete, complete ex commands
set wildmode=longest:full   " Add comma separated option 'list' to see the whole list of options above.
set path+=**                " Search down subfolders through :find and tab, specify the folder to search in to avoid overhead
set showcmd                 " Show command being executed
set incsearch               " Highlight conincidences as you search
set hidden                  " Hide buffers instead of closing them. This has benefits like: move across buffers without having to save them. Keep buffers in memory. After changing to a different buffer and going back to the previous buffer, unoding is possible.
set omnifunc=syntaxcomplete#Complete
set backspace=indent,start  " :help 'backspace' make backspace delete those levels
set autoread                " :help 'autoread' make changes available in vim
set foldmethod=indent
set nofoldenable            " To avoid starting folded, folds enabled by pressing z comb
set colorcolumn=81,121
set hlsearch
set laststatus=2            " Have status bar available always (for every window)
set ruler
set display+=lastline       " Not fully displayed lines end in @@@
set list                    " Display unprintable characters
set listchars=tab:\·\ ,trail:-,extends:>,precedes:< " Unprintable chars mapping
" set rulerformat=%l,%c%V%=%P
" set ruler

" ============== PLUGINS ===================
call plug#begin('~/.vim/plugged')
" See https://github.com/junegunn/vim-plug for possibilities
Plug 'vim-syntastic/syntastic'              " Syntax checker
Plug 'henrik/vim-indexed-search'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'                                 " Install fzf manually
Plug 'junegunn/fzf.vim'                             " Relying on fzf again as :find alone can't find in hidden folders
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Debug
Plug 'puremourning/vimspector'
" LSP
Plug 'prabirshrestha/vim-lsp'
" Syntax
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'StanAngeloff/php.vim'
Plug 'PProvost/vim-ps1'
Plug 'ap/vim-css-color'
Plug 'aklt/plantuml-syntax'
Plug 'udalov/kotlin-vim'
Plug 'Vimjas/vim-python-pep8-indent' "Fix wrong indentation on new lines https://stackoverflow.com/a/39554322/7274945
" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'Konfekt/FastFold'
" Plug 'VundleVim/Vundle.vim'
" Plug 'ajh17/VimCompletesMe'
" Plug 'vim-airline/vim-airline'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'vim-jp/vim-cpp'
" Plug 'mbbill/undotree'
" Plug 'nathanaelkane/vim-indent-guides'
" Color schemes
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'noahfrederick/vim-noctu', { 'name': 'noctu' }
Plug 'jeffkreeftmeijer/vim-dim', { 'name': 'dim' }
call plug#end()

" ================= Code formatting =====================
autocmd FileType c,cpp,h,hpp,python,javascript,css,html,json,sh,tcl setlocal shiftwidth=4 softtabstop=4 tabstop=4 noexpandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab

" ================= VIM-LSP =============================
let g:lsp_document_highlight_enabled = 0
" Resgister Javascript server
if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
	\ 'name': 'javascript support using typescript-language-server',
	\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
	\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
	\ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
	\ })
endif
" Resgister Python server
" Add this line for handling checkers in vim-lsp
" 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}, 'pycodestyle': {'enabled': v:true}, 'pylint': {'enabled': v:true}}}}
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
	\ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}, 'pycodestyle': {'enabled': v:true}, 'pylint': {'enabled': v:true}}}}
        \ })
endif
" Resgister Swift server (Mac only, included as xcrun tools)
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	" setlocal signcolumn=yes
	" nmap <buffer> gd <plug>(lsp-definition)
	" nmap <buffer> <f2> <plug>(lsp-rename)
	" refer to doc to add more commands
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"  ================  NETRW CONFIGURATION =================
let g:netrw_browse_split=0  " Default, use current window to open file
let g:netrw_liststyle=3     " Allow netrw to expand and collapse, see like a tree
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+' <---- Hide something from list

"  ================  TEMPORAL FILES      =================
let g:netrw_browse_split=0  " Default, use current window to open file
" Concentrate temporal files files in the same location https://vi.stackexchange.com/a/179
set directory^=$HOME/.vim/tmp// " Swap files (e.g. %home%tocino%.vimrc)
set backupdir^=$HOME/.vim/tmp// " Temporal (file.ext~)
set undodir^=$HOME/.vim/undo//   " I can't recall how these look

" ================= COLOR SCHEME CONFIGURATION ===========
syntax enable               " Colors for syntax
" Download gruvbox from (I'm not using a status bar)
" https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
colorscheme dim
set number                  " Line numbers in gutter
set background=dark         " Dark mode
" Dracula configuration start
let g:dracula_italic = 0
highlight Normal ctermbg=None
" if (has("termguicolors"))
" 	" Be careful to use this only in the GUI application, otherwise
" 	" expect no colors. This doesn't affect in my Linux envs as I compile
" 	" without termguicolors.
" 	set termguicolors
" endif
" Dracula configuration end

" ============== JUMP VIM LIST =============
" https://stackoverflow.com/a/27204000
" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
	if a:direction == "up"
		try
			execute a:prefix . "previous"
		catch /^Vim\%((\a\+)\)\=:E553/
			execute a:prefix . "last"
		catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
		endtry
	elseif a:direction == "down"
		try
			execute a:prefix . "next"
		catch /^Vim\%((\a\+)\)\=:E553/
			execute a:prefix . "first"
		catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
		endtry
	endif
endfunction

" ============== KEYMAPPINGS ================
" Clear highlight with Control L, taken from vim-sensible
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" (A)nalyze code
nnoremap <leader>a :SyntasticCheck<CR>
" (C)lose 'location-list-window', the one syntastic uses for showing errors
" and reset Syntastic to avoid opening the error buffer upon switching buffers
nnoremap <leader>c :SyntasticReset<CR> :lclose<CR>
" (S)pell check
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>
nnoremap <PageUp> :bnext<CR>
nnoremap <PageDown> :bprev<CR>
" Next/previous in location list (triggered by e.g. LspDefinition)
nnoremap <C-k> :call WrapCommand('up', 'c')<CR>
nnoremap <C-j>  :call WrapCommand('down', 'c')<CR>
" Next/previous in quickfix list (triggered by e.g. SyntasticCheck)
nnoremap <C-p> :call WrapCommand('up', 'l')<CR>
nnoremap <C-n> :call WrapCommand('down', 'l')<CR>
" vim-lsp
nnoremap <leader>dc :LspDeclaration<CR>
nnoremap <leader>df :LspDefinition<CR>
nnoremap <leader>da :LspDocumentDiagnostics<CR>
nnoremap <leader>dh :LspHover<CR>
" Quickly search
" nnoremap <leader>f :find 
nnoremap <leader>f :Files<CR>
" Switch (B)uffers (note the space after :b)
nnoremap <leader>b :ls<CR>:b 
" (T)abularize
vnoremap <leader>t :Tab/
nnoremap <leader>t :Tab/
" Python JSON format module
nnoremap <leader>j :%!python3 -m json.tool<CR>
" Move across splits
nmap <silent> <up> :wincmd k<CR>
nmap <silent> <down> :wincmd j<CR>
nmap <silent> <left> :wincmd h<CR>
nmap <silent> <right> :wincmd l<CR>
nmap <silent> <c-up> :wincmd +<CR>
nmap <silent> <c-down> :wincmd -<CR>
nmap <silent> <c-left> :wincmd <<CR>
nmap <silent> <c-right> :wincmd ><CR>
" Expand common enclosing signs to allow keep writing inside
" inoremap () ()<C-c>i
" inoremap [] []<C-c>i
" inoremap {} {}<C-c>i
" inoremap "" ""<C-c>i
" inoremap '' ''<C-c>i
" Create and align tables as you type
function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" ================= asyncomplete.svim =================
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" Uncomment this block to trigger by pressing tab - - -
" let g:asyncomplete_auto_popup = 0
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ asyncomplete#force_refresh()
" Uncomment this block to trigger by pressing tab - - -
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" ================= fzf.vim ============================


" ============ snipmate ================================
let g:snipMate = {}
let g:snipMate.snippet_version = 1
let g:snipMate.no_default_aliases = 1
" <Plug>snipMateTrigger

" ============= vim-indexed-search ======================
let g:indexed_search_colors = 0
let g:indexed_search_numbered_only = 1

" ================= vim-javascript ======================
let g:javascript_plugin_jsdoc = 1

" ================= vim-python === ======================
let g:python_highlight_all = 1

" ================ vim-python-pep8-indent ===============
" let g:python_pep8_indent_multiline_string = 0
" let g:python_pep8_indent_hang_closing

" ================= vimspector ==========================
let g:vimspector_enable_mappings = 'HUMAN'

" ============== Status line ============================
set statusline=                                            " Clear status line
" set statusline+=%#warningmsg#                            " hl- style
" set statusline+=%{SyntasticStatuslineFlag()}             " Don't know
set statusline+=%#PmenuSel#                                " hl- style
set statusline+=%m                                         " Modified?
set statusline+=%#StatusLine#                              " hl- style
set statusline+=\ %r                                       " Read only
set statusline+=\ [f:%f\]                                  " Name tail
set statusline+=\ [enc:%{&fileencoding?&fileencoding:&encoding}]
set statusline+=\ [ff:%{&fileformat}\]
set statusline+=\ %3.p%%                                   " Percentage
set statusline+=\ %l/%L:%c                                 " line/TotalLines:Col
" I have the time available from many other places. Also it refreshes after
" input which doesn't really fit my needs
" set statusline+=%=                                       " Align to the right
" set statusline+=%{strftime('%a\ \|\ %F\ \|\ %H:%M:%S\ ')}" Time
" ============== Syntax checkers ========================
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint', 'pycodestyle', 'pydocstyle']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol="x"
let g:syntastic_style_error_symbol="S"
let g:syntastic_warning_symbol="!"
let g:syntastic_style_warning_symbol="s"
let g:syntastic_sort_aggregated_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_ignore_files=['\m/node_modules/', '\m/__pycache__/']
let g:syntastic_mode_map = {
	\ "mode": "passive",
	\ "active_filetypes": [],
	\ "passive_filetypes": [] }

" ============== WINDOWS SPECIFIC CONFIG ================
if has("win32")
	" Python instead of python3
	nnoremap <leader>j :%!python -m json.tool<CR>
	" Unprintable characters
	set listchars=tab:\|\ ,trail:-,extends:>,precedes:< " Unprintable chars mapping
	set belloff=all
	" Kill pop ups
	set guioptions+=lrbmTLce
	set guioptions-=lrbmTLce
	set guioptions+=c
	" Do not blink, block cursor
	set guicursor+=a:blinkon0
	set guicursor+=a:block-Cursor
	" Fix line endings IN GOOGLE KEEP. This messes some config files in windows.
	" use ff=dos when needed... or save again in notepad.
	" It means fileformat
	set ff=unix
	" Avoid mouse interaction other than selecting
	set mouse=c
	" set guifont=terminus:h14
	set guifont=DejaVu\ Sans\ Mono:h14
	set guioptions-=m "remove menu bar
	set guioptions-=T "remove toolbar
	set guioptions-=r "remove right-hand scroll bar
	set guioptions-=L "remove left-hand scroll bar
	colorscheme dracula
endif
