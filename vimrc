filetype plugin indent on
syntax on

set packpath^=~/.vim
packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

""" Language Specific Plugins
" Coq
call minpac#add('the-lambda-church/coquille')
" Haskell
call minpac#add('neovimhaskell/haskell-vim')

"Elm
call minpac#add('ElmCast/elm-vim')

"Fish
call minpac#add('dag/vim-fish')

""" Themes
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('altercation/vim-colors-solarized')

""" Completion plugins
call minpac#add('neoclide/coc.nvim', {'do': { -> coc#util#install() }})

""" Utilities
call minpac#add('w0rp/ale')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('myusuf3/numbers.vim')
call minpac#add('kien/rainbow_parentheses.vim')
call minpac#add('vim-scripts/restore_view.vim')
call minpac#add('godlygeek/tabular')
call minpac#add('vim-airline/vim-airline')
call minpac#add('Townk/vim-autoclose')
call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('nathanaelkane/vim-indent-guides')
" call minpac#add('suan/vim-instant-markdown')
call minpac#add('dbakker/vim-lint')
call minpac#add('guns/vim-sexp')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-obsession')

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" Change the leader but retain the ability to backwards char search
let mapleader = ","
noremap \ ,

set t_Co=256 "256 color support
set background=light
colorscheme solarized

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" Autosave open files when window loses focus
" Note: this doesn't support saving untitled buffers
au FocusLost * silent! wa

" Always switch to the current file directory when opening a new buffer
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Remove the ugly pipe separator for windows
set fillchars+=vert:\ 

" Enhance the functionality of '%'
runtime macros/matchit.vim

" vim-airline config
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
" end vim-airline config

set shortmess+=mnrxoOtT                        " Abbrev. of messages (avoids 'hit enter')
set virtualedit=onemore                        " Allow for cursor beyond last character
set history=1000                               " Store a ton of history (default is 20)

set backup                                     " allow backups
set undofile                                   " persistent undo
set undolevels=1000
set undoreload=10000

set showmode                                   " Display the current mode
set cursorline                                 " Highlight current line
set clipboard=unnamedplus                          " OSX clipboard access.

set ruler                                      " Display file information in the status bar
set backspace=indent,eol,start                 " Backspace for dummies
set linespace=0                                " No extra spaces between rows
set number                                     " Line numbers on
set showmatch                                  " Show matching brackets/parenthesis
set incsearch                                  " Find as you type search
set hlsearch                                   " Highlight search terms
set ignorecase                                 " Case insensitive search
set smartcase                                  " Case sensitive when uc present
set winminheight=0                             " Windows can be 0 line high
set wildmenu                                   " Show list instead of just completing
set wildmode=list:longest,full                 " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]                  " Backspace and cursor keys wrap too
set scrolljump=5                               " Lines to scroll when cursor leaves screen
set scrolloff=3                                " Minimum lines to keep above and below cursor
set foldenable                                 " Auto fold code
set list
set listchars="tab:›\ ,trail:•,extends:#,nbsp:." " Highlight problematic whitespace
set nowrap                                     " Disable line wrapping by default
set colorcolumn=80                             " Set a visual column marker at 80 chars

set autoindent                                 " Indent at the same level of the previous line
set shiftwidth=2                               " Use indents of 2 spaces
set expandtab                                  " Tabs are spaces, not tabs
set tabstop=2                                  " An indentation every two columns
set softtabstop=2                              " Let backspace delete indent
set encoding=utf-8                             " UTF-8 by default

" Automatically wrap j and k to the next/prev line
nnoremap j gj
nnoremap k gk

" Shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q   q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    command! -bang Tabn tabn<bang>
endif

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" For when you forget to sudo.. Really write the file.
cmap w!! w !sudo tee % >/dev/null

set tags=./tags;/,~/.vimtags

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

""" Ctrl-P
hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|gradle)$',
  \ 'file': '\v\.(exe|so|dll|bin)$',
  \ }

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': 'find %s -type f'
\ }

""" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>

"""" coc.nvim
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>""
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" ale
" Ensure that Ale uses Stack to properly configure project deps when linting.
let g:ale_linters = {
\  'haskell': ['stack_build', 'stack_ghc'],
\  'python':  ['pylint']
\}

let g:ale_fixers = {
\  'python': ['black'],
\  'go': ['goimports']
\}

" Fix files automatically on save.
let g:ale_fix_on_save = 1

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

""" Rainbow Parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""" Functions
function! InitializeDirectories()
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    let dir_list['undo'] = 'undodir'
    let common_dir = parent . '/' . prefix

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir .dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -o " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction

call InitializeDirectories()

" XML formatter
function! DoFormatXML() range
    " Save the file type
    let l:origft = &ft

    " Clean the file type
    set ft=

    " Add fake initial tag (so we can process multiple top-level elements)
    exe ":let l:beforeFirstLine=" . a:firstline . "-1"
    if l:beforeFirstLine < 0
        let l:beforeFirstLine=0
    endif
    exe a:lastline . "put ='</PrettyXML>'"
    exe l:beforeFirstLine . "put ='<PrettyXML>'"
    exe ":let l:newLastLine=" . a:lastline . "+2"
    if l:newLastLine > line('$')
        let l:newLastLine=line('$')
    endif

    " Remove XML header
    exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

    " Recalculate last line of the edited code
    let l:newLastLine=search('</PrettyXML>')

    " Execute external formatter
    exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

    " Recalculate first and last lines of the edited code
    let l:newFirstLine=search('<PrettyXML>')
    let l:newLastLine=search('</PrettyXML>')

    " Get inner range
    let l:innerFirstLine=l:newFirstLine+1
    let l:innerLastLine=l:newLastLine-1

    " Remove extra unnecessary indentation
    exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

    " Remove fake tag
    exe l:newLastLine . "d"
    exe l:newFirstLine . "d"

    " Put the cursor at the first line of the edited code
    exe ":" . l:newFirstLine

    " Restore the file type
    exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>

" Maps Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()
