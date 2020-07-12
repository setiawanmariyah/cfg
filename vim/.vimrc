" In the name of Allah, the most Gracious, the most Merciful.
" 
"  ▓▓▓▓▓▓▓▓▓▓
" ░▓ Author ▓ Abdullah <https://abdullah.today>
" ░▓▓▓▓▓▓▓▓▓▓
" ░░░░░░░░░░
" 
" ░█░█░▀█▀░█▄█
" ░▀▄▀░░█░░█░█
" ░░▀░░▀▀▀░▀░▀

set nocompatible
set ruler
set title
set titlelen=0
set titlestring=%t%(\ %m%)%(\ (%{hostname()}\ %{expand(\"%:p:~:h\")})%)%(\ %a%)
let perl_no_extended_vars=1
let python_no_builtin_highlight=1
let g:zenburn_high_Contrast=1
let g:zenburn_old_Visual=1
let g:colors_name = 'zenburn'
let g:airline_theme = 'zenburn'

if &term == "linux"
    set bg=dark
endif
if has("gui_running")
    "configure in gvimrc
elseif &t_Co == 256
    silent! color desert
    silent! color zenburn
else
    silent! color slate
endif

if has("termguicolors")
	if &term == "tmux-256color"
		let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
		let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	endif
	if &term =~ "^(tmux|xterm)-256color"
		set termguicolors
	endif
endif



set fo+=w
cmap w!! %!sudo tee > /dev/null %
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Set relative number but also show current line number (no zero for current
" line)
silent! set number relativenumber
silent! set numberwidth=4

if exists('g:loaded_translate_plugin')
  finish
endif
let g:loaded_translate_plugin = 1

command! -nargs=* Translate call translate#run(<q-args>)
command! -nargs=* -range TranslateVisual call translate#visual(<q-args>)
command! -nargs=* -range TranslateReplace call translate#replace(<q-args>)
command! TranslateOpen call translate#open_trans_buf('')
command! TranslateClear call translate#clear_trans_buf()

set hlsearch
autocmd! bufwritepost $HOME/.Xresources !xrdb -load $HOME/.Xresources 
autocmd! bufwritepost $HOME/.zshrc	!source $HOME/.zshrc
autocmd! bufwritepost $HOME/.config/sxhkd/sxhkdrc	!pkill -USR1 -x sxhkd
autocmd! bufwritepost $HOME/cfg/sxhkd/.config/sxhkd/sxhkdrc	!pkill -USR1 -x sxhkd
autocmd! bufwritepost $HOME/cfg/zsh/.zsh/custom-alias !source $HOME/.zsh/custom-alias
autocmd! bufwritepost $HOME/cfg/polybar/.config/polybar/*.conf !bspc wm -r >/dev/null 2>&1 
set nocp
filetype on
au BufNewFile,BufRead *Pkgfile set filetype=sh
set textwidth=80
if !&scrolloff
  set scrolloff=3
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set fileencoding=utf-8
set encoding=utf-8
"set foldmethod=indent
"set foldlevel=99
filetype plugin indent on
set showmode
set ai
set sc
set incsearch
set completeopt=menuone
set ignorecase
set gdefault
com! -complete=file -bang -nargs=? W :w<bang> <args>
set smartcase
set cursorline
"set cursorcolumn
set noexpandtab
set backspace=indent,eol,start
if has("syntax")
    syntax on
    syntax sync minlines=200
endif
if has('mouse') | set mouse=a | endif 
let mapleader=" "
set hidden
set autoread
set history=10000
filetype indent on
filetype plugin on
set linebreak 
set display+=lastline
set display+=truncate
set display+=uhex
silent! set listchars=eol:¬,tab:→.,extends:»,precedes:«,trail:•
set wrap
set tabstop=8
set smarttab copyindent preserveindent
set shiftwidth=4
set softtabstop=4
set expandtab
retab
set clipboard=unnamed,unnamedplus
set ttyfast
set smartindent
set wildmenu
silent! set wildignorecase
set noerrorbells visualbell t_vb=
set shortmess+=I
set autoindent
set nocindent
set cinkeys=0{,0},0),:,!,o,O,e
set formatoptions=tcrqnj
set comments-=:%
set comments-=:XCOMM
set lazyredraw
set noshowmatch
if has("unix")
    if has("nvim")
        set undofile
    else
        silent! set undodir=~/.vim/undodir//
        silent! set undofile
    endif
endif
set noshowmode 
set viminfo='10,\"100,:20,%,n~/.viminfo
autocmd BufWritePre *.c,*.cpp,*.cc,*.h,*.sh,*.hpp,*.py,*.m,*.mm :%s/\s\+$//e
set modeline
set nobackup
set showcmd
set whichwrap=b,s,<,>,[,]
set laststatus=2
set splitbelow splitright
set tabpagemax=20
if &t_Co > 16
	setl cursorline
	au WinEnter * setl cursorline
	au WinLeave * setl nocursorline
	au FocusGained * setl cursorline
	au FocusLost * setl nocursorline
endif

let g:instant_markdown_browser = "/usr/bin/google-chrome-stable --new-window"
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_port = 47479
let g:powerline_pycmd = 'py3'
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
 
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:ale_fix_on_save = 1
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

:noremap <leader>u :w<Home>silent <End> !urlview<CR>
map <leader>n :NERDTreeToggle<CR>
" comment out current line
map <leader>c 0i# <ESC>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap ; :
nnoremap K <nop>
nnoremap q :q
nnoremap Q q
inoremap # X#
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd BufEnter *.md exe 'noremap <F5> :!google-chrome-stable %:p<CR>'
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

function! DeleteFunctionUnderCursor()
  let line = getline('.')
  normal diwxml
  let i = 1
  let c = 1
  while i <= strlen(line)
      let char = getline('.')[col('.') - 1]
      if (char == '(')
          let c += 1
      elseif (char == ')')
          let c -= 1
      endif
      if (c == 0)
          normal x`l
          break
      endif
      normal l
      let i += 1
  endwhile
endfunc

command! -range=% DeleteFunctionUnderCursor <line1>,<line2>call DeleteFunctionUnderCursor()

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
       set relativenumber
    endif
endfunc
command! ToggleNumber call ToggleNumber()

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit | 0d_ | diffthis 
        \ wincmd p | diffthis
endif

"if &t_Co == 8 && $TERM !~# '^linux\|^Eterm|^screen-*'
"  set t_Co=16
"endif

if has("nvim")
	silent! set guicursor=
endif

hi CursorLineNr cterm=NONE



" duplicate lines
function! HighlightRepeats() range
    let lineCounts = {}
    let lineNum = a:firstline
    while lineNum <= a:lastline
        let lineText = getline(lineNum)
        if lineText != ""
            let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
        endif
        let lineNum = lineNum + 1
    endwhile
    exe 'syn clear Repeat'
    for lineText in keys(lineCounts)
        if lineCounts[lineText] >= 2
            exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
        endif
    endfor
endfunction
command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()
autocmd FileType python set breakindentopt=shift:4

" comfortable navigation
" noremap <buffer> j gj
" noremap <buffer> k gk
" noremap <buffer> gj j
" noremap <buffer> gk k

nnoremap k gk
nnoremap j gj
nnoremap <Up> gk
nnoremap <Down> gj
nnoremap <Tab> %
vnoremap <Tab> %

if has("nvim") || has("terminal")
	tnoremap <Esc> <C-\><C-n>
endif

nnoremap <Leader>l :ls<CR>:b<Space>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>rw :%s/\<<C-r><C-w>\>/
" sort CSS properties
nnoremap <Leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
" reselect pasted text
nnoremap <Leader>v `[V`]
" rewrap current paragraph
nnoremap <Leader>w gq}
" strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=""<CR>

" fix application-numpad mode
if !has("nvim")
	" (Vim 8.1) with Num Lock off, Num5 is parsed as individual commands
	map! <Esc>OE <Nop>
endif


set nottimeout		" disable timeout for key codes (enabled by defaults.vim)

""" File-specific behavior

if has("autocmd")
	au BufNewFile,BufRead COMMIT_EDITMSG,git-rebase-todo
	\ setl nomodeline

	au BufNewFile,BufRead /etc/motd
	\ setl et

	au BufNewFile,BufRead authorized_keys*,known_hosts,id_*.pub
	\ setl ft=conf wrap nolinebreak

	au! BufNewFile */_posts/2*.html
	\ 0r %:h/_template.html

	if has("nvim")
		" Neovim 0.2.1: terminal buffers now have line numbers
		au! TermOpen * setl nonumber norelativenumber
	endif
endif


" some pastebins commands
" for GUI apps like browsers, paste the URL with CTRL+v
command! -range=% CL  <line1>,<line2>w !curl -F 'clbin=<-' https://clbin.com | tr -d '\n' | xclip -i -selection clipboard

" Another good pastebin same as CTRL+v paste.
command! -range=% VP  <line1>,<line2>w !curl -F 'text=<-' http://vpaste.net | tr -d '\n' | xclip -i -selection clipboard

" pastebin ptpb is now down but is the best pastebin ever
command! -range=% PB  <line1>,<line2>w !curl -F 'c=@-' https://ptpb.pw/ | sed -n 's/^url: //p' | xclip

command! -range=% TB  <line1>,<line2>w !fb

command! -range=% GT <line1>,<line2>w !gist -c -p -f %


map <F3> :! ( urxvt & ) &>/dev/null &<CR><CR>

" Run python code without exiting vim
nmap <silent> <Leader>m :w<CR>:!clear && python % > /tmp/vim-py.out && cat /tmp/vim-py.out && rm -f /tmp/vim-py.out<CR>

" Run bash code without exiting vim
nmap <silent> <Leader>b :w<CR>:!clear && bash % > /tmp/vim-bash.out && cat /tmp/vim-bash.out && rm -f /tmp/vim-bash.out<CR>

" vim: set ft=vim :
