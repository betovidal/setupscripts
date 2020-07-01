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
set showcmd
let mapleader=","           " To add more functionality, instead of \
filetype plugin on          " Enable netwr
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
" These are in old config
Plug 'morhetz/gruvbox'                      " Color theme
Plug 'henrik/vim-indexed-search'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
" Plug 'VundleVim/Vundle.vim'
" Plug 'ajh17/VimCompletesMe'
" Plug 'PProvost/vim-ps1'
" Plug 'vim-airline/vim-airline'
" Plug 'pangloss/vim-javascript'
" Plug 'PotatoesMaster/i3-vim-syntax'
" Plug 'vim-jp/vim-cpp'
" Plug 'mbbill/undotree'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'dracula/vim'
call plug#end()

" ================ simple snips =========================
let g:ssnips_cursor="█"
let g:ssnips_end_in_insert_mode=1
let g:ssnips_path="~/.vim/ssnips/"

" ================= Code formatting =====================
autocmd FileType c,cpp,h,hpp,python,javascript,css,html,json,tcl setlocal shiftwidth=4 softtabstop=4 tabstop=4

" ================= VIM-LSP =============================
autocmd FileType typescript setlocal omnifunc=lsp#complete
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	" setlocal signcolumn=yes
	" nmap <buffer> gd <plug>(lsp-definition)
	" nmap <buffer> <f2> <plug>(lsp-rename)
	" refer to doc to add more commands
endfunction
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
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

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
set undodir^=$HOME/.vim/tmp//   " I can't recall how these look

" ================= COLOR SCHEME CONFIGURATION ===========
syntax enable               " Colors for syntax
colorscheme gruvbox         " Download from https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
set number                  " Line numbers in gutter
set background=dark         " Dark mode

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
" Next/previous in location list (triggered by e.g. LspDefinition)
nnoremap <C-k> :call WrapCommand('up', 'c')<CR>
nnoremap <C-j>  :call WrapCommand('down', 'c')<CR>
" Next/previous in quickfix list (triggered by e.g. SyntasticCheck)
nnoremap <C-p> :call WrapCommand('up', 'l')<CR>
nnoremap <C-n> :call WrapCommand('down', 'l')<CR>
" vim-lsp
nnoremap <leader>dc :LspDeclaration<CR>
nnoremap <leader>df :LspDefinition<CR>
nnoremap <leader>h :LspHover<CR>
" Quickly search
nnoremap <leader>f :find 
" Switch (B)uffers (note the space after :b)
nnoremap <leader>b :ls<CR>:b 
" (T)abularize
vnoremap <leader>t :Tab/
nnoremap <leader>t :Tab/
" Python JSON format module
nnoremap <leader>j :%!python -m json.tool<CR>
" Call snip completion
" nnoremap <leader>s :call dumbsnips#expand()<CR>
inoremap <expr> <C-B> "<ESC>:call ssnips#expand()<CR>"
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

" ============= vim-indexed-search ======================
let g:indexed_search_colors = 0
let g:indexed_search_numbered_only = 1

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
" set statusline+=%=                                         " Align to the right
" set statusline+=%{strftime('%a\ \|\ %F\ \|\ %H:%M:%S\ ')}  " Time
" ============== Syntax checkers ========================
let g:syntastic_javascript_checkers = ['eslint']
" Install $pip pylama and $pip pylama_pylint
let g:syntastic_python_checkers = ['pycodestyle', 'pydocstyle']
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
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
	set guioptions-=m "remove menu bar
	set guioptions-=T "remove toolbar
	set guioptions-=r "remove right-hand scroll bar
	set guioptions-=L "remove left-hand scroll bar
endif
