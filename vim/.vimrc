set encoding=utf-8

call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/landscape.vim'
  Plug 'maximbaz/lightline-ale'
  Plug 'Valloric/YouCompleteMe'
  Plug 'w0rp/ale'
  "Plug 'editorconfig/editorconfig-vim' git magic, no need for now
  Plug 'fatih/vim-go'
  Plug 'keith/swift.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  "Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
  Plug 'wakatime/vim-wakatime'
  Plug 'mattn/webapi-vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'airblade/vim-gitgutter'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug '~/.vim/bundle/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'roman/golden-ratio'
  Plug 'qpkorr/vim-bufkill'
  Plug 'metakirby5/codi.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'jiangmiao/auto-pairs'
  Plug 'Yggdroot/indentLine'
  Plug 'easymotion/vim-easymotion'
  Plug 'kamykn/spelunker.vim'
  "Plug 'kamykn/CCSpellCheck.vim'


call plug#end()


" aotoexec {
  "autocmd VimEnter * silent !tmux set -g status off
  "autocmd VimEnter * silent !tmux set -g pane-border-status off
  " autocmd VimLeave * silent !tmux set -g status on
  "autocmd VimLeave * silent !tmux set -g pane-border-status bottom
  "au FocusLost * :set laststatus=0
  "au FocusGained * :set laststatus=2
  "autocmd InsertLeave * redraw!
" }

" UI {
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  set background=dark
  color dracula
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar
  set laststatus=2
  set cursorline
  let g:lightline = {
      \    'colorscheme': 'one',
      \    'component_function': {
      \      'filename': 'LightlineFilename',
      \      'spotify': 'Spotify',
      \    },
      \ }
  let g:lightline.component_expand = {
      \    'linter_checking': 'lightline#ale#checking',
      \    'linter_warnings': 'lightline#ale#warnings',
      \    'linter_errors': 'lightline#ale#errors',
      \    'linter_ok': 'lightline#ale#ok',
      \ }
  let g:lightline.component_type = {
      \    'linter_checking': 'left',
      \    'linter_warnings': 'warning',
      \    'linter_errors': 'error',
      \    'linter_ok': 'left',
      \   }
  let g:lightline.active = {
      \   'right': [
      \      [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \      [ 'lineinfo' ],
      \      [ 'percent' ],
      \      [ 'fileencoding', 'filetype' ]
      \   ],
      \   'left': [
      \      [ 'mode', 'paste' ],
      \      [ 'readonly', 'filename' ]
      \   ],
      \ }


  let g:indentLine_leadingSpaceChar = '·'
  let g:indentLine_leadingSpaceEnabled = 1
  let g:indentLine_enabled= 0
  let g:indentLine_fileTypeExclude = ['nerdtree']
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" }

" Keys, maps {
  " Map ; to :
  nnoremap ; :
  " Toggle between normal and relative numbering.
  nnoremap <leader>r :call NumberToggle()<cr>

  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
 "love spacemacs
  let mapleader=" "
  "inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))
  "inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("<C-j>"))
  "noremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))
  "noremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("<C-k>"))
  noremap <Leader>pt :call NERDTreeToggleInCurDir()<CR>
  noremap <Leader>sc :nohl<CR>
  noremap <Leader>pf :GFiles<CR>
  noremap <Leader>ps :Ag!<CR>
  noremap <Leader>pS :Ag! <cword><CR>
  vnoremap <Leader>ps :<C-u>Agv!<CR>
  noremap <Leader>ff :Files<CR>
  noremap <Leader>bb :Buffers<CR>
  noremap <Leader>bs :enew<CR>
  noremap <Leader>bd :BD<CR>
  noremap <Leader>bw :BW<CR>
  noremap <Leader>bc :badd<space>
  noremap <Leader>bn :bn<CR>
  noremap <Leader>tp gT
  noremap <Leader>tn gt
  noremap <Leader>bp :bp<CR>
  noremap <Leader>ld yyp
  noremap <Leader>wd :q<CR>
  noremap <Leader>wt <C-w>T
  noremap <Leader>wl <C-w>l
  noremap <Leader>wh <C-w>h
  noremap <Leader>wj <C-w>j
  noremap <Leader>wk <C-w>k
  noremap <Leader>ws :<C-u>split<CR>
  noremap <Leader>wv :<C-u>vsplit<CR>
  noremap <Leader>H :vertical resize +5<CR>
  noremap <Leader>L :vertical resize -5<CR>
  noremap <Leader>fs :w<CR>
  noremap gt :NERDTreeFind<CR>
  nnoremap <leader>Tm :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  vmap < <gv
  vmap > >gv

  let g:ycm_key_list_stop_completion = ['<C-l>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-k>']
  let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-j>']

  " I hate C-p
  map <C-p> <Nop>
  map <C-n> <Nop>
  imap <C-p> <Nop>
  imap <C-k> <Nop>

  "vimrc
  map <leader>fed :e $MYVIMRC<CR>
  map <leader>feR :source $MYVIMRC<CR>

  " <TAB>: completion.
  "inoremap <expr><TAB>  pumvisible() ? '\<C-n>' : '\<TAB>'

  "Copy and paste from system clipboard
  "vnoremap <TAB> :YcmCompleter Format<CR>
  vnoremap <TAB> :YcmCompleter Format<CR>
  vmap <Leader>sy "+y
  vmap <Leader>d "+d
  nmap <Leader>sp "+p
  nmap <Leader>sP "+P
  nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)

  nmap <silent> <Leader>en <Plug>(ale_next_wrap)
  nmap <Leader>wm <Plug>(golden_ratio_resize)
  "command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)
  command! -bang -nargs=* Agv
  \ call fzf#vim#ag(GetVisualSelection(),
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)
  "" }
"
" YCM {
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
" }
" ALE {
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 2
  "let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
  let g:ale_python_flake8_args="--ignore=E501"

  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'swift': ['swiftlint'],
  \   'python': ['mypy'],
  \   'typescript': ['tslint'],
  \}

  let g:ale_python_pylint_args="--load-plugins pylint_django"

  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_sign_error = '!'
  let g:ale_sign_warning = '?'
" }

" General {
  let g:codi#autoclose = 1
  let g:codi#width = 80
  let g:codi#rightsplit = 0
  set signcolumn=yes
  set number
  set noshowmode
  set updatetime=100
  set backspace=indent,eol,start      " Allow backspace over everything in insert mode.
  set noswapfile
  set smarttab
  set lazyredraw
  set secure
  set exrc
  set ttyfast
  set noautoindent        " I indent my code myself.
  set nocindent           " I indent my code myself.
  set omnifunc=syntaxcomplete#Complete
  set nrformats-=octal
  set ttimeout
  set ttimeoutlen=100
  set hlsearch            " Highlight search results.
  set ignorecase          " Make searching case insensitive
  set smartcase           " ... unless the query has capital letters.
  set incsearch           " Incremental search.
  set gdefault            " Use 'g' flag by default with :s/foo/bar/.
  set magic               " Use 'magic' patterns (extended regular expressions).

  set noshowcmd             " Show (partial) command in status line.
  set colorcolumn=0
  set showmatch           " Show matching brackets.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.
  set noerrorbells        " No beeps.
  set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
  set list
  set listchars=tab:›\ ,trail:·

  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.
  set autoread            " If file updates, load automatically.
  " Reload vim whenever the config files changes

  set display+=lastline
  set nostartofline       " Do not jump to first character with page commands.

  if &encoding ==# 'latin1' && has('gui_running')
    set encoding=utf-8
  endif

  " Tell Vim which characters to show for expanded TABs,
  " trailing whitespace, and end-of-lines. VERY useful!
  if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:+
  endif

  " Also highlight all tabs and trailing whitespace characters.
  highlight ExtraWhitespace ctermfg=darkgray
  "match ExtraWhitespace /\s\+$\|\t/
  match ExtraWhitespace /\s\+$/
" }

" Configuration {
  let g:golden_ratio_exclude_nonmodifiable = 1
  let g:golden_ratio_autocommand = 0
  if has('autocmd')
    filetype plugin indent on
  endif
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif

  " Remove special characters for filename
  set isfname-=:
  set isfname-==
  set isfname-=+

  if &history < 1000
    set history=1000      " Number of lines in command history.
  endif
  if &tabpagemax < 50
    set tabpagemax=50     " Maximum tab pages.
  endif

  if &undolevels < 200
    set undolevels=200    " Number of undo levels.
  endif

  " Path/file expansion in colon-mode.
  set wildmenu
  set wildmode=list:longest
  set wildchar=<TAB>

  if !empty(&viminfo)
    set viminfo^=!        " Write a viminfo file with registers.
  endif
  set sessionoptions-=options



  " Remove trailing spaces before saving text files
  " http://vim.wikia.com/wiki/Remove_trailing_spaces
  autocmd BufWritePre * :call StripTrailingWhitespace()
  function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
      normal mz
      normal Hmy
      if &filetype == 'mail'
  " Preserve space after e-mail signature separator
        %s/\(^--\)\@<!\s\+$//e
      else
        %s/\s\+$//e
      endif
      normal 'yz<Enter>
      normal `z
    endif
  endfunction

  " Diff options
  set diffopt+=iwhite
" }

" Languages {
 let g:spelunker_disable_auto_group = 1
" specify custom autogroup with file types you want to check:
  augroup spelunker
    autocmd!
    autocmd BufWinEnter,BufWritePost ,*.js,*.jsx,*.json,*.md call spelunker#check()
  augroup END
  autocmd Filetype gitcommit setlocal textwidth=72
  autocmd FileType go set sw=4
  autocmd FileType go set tabstop=4
  autocmd FileType go set sts=0
  autocmd FileType go set expandtab
  autocmd FileType go set smarttab
  autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType javascript nmap <buffer> gf :YcmCompleter GoTo<CR>
  autocmd FileType javascript nmap <buffer> gd :YcmCompleter GoToDeclaration<CR>
  autocmd FileType javascript nmap <buffer> gr :YcmCompleter GoToReferences<CR>
  autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType p/ython setlocal expandtab sw=4 ts=4 sts=4
  autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType php setlocal expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufReadPost *.jade set filetype=pug
  autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType jade setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType less setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType htmldjango setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType css set ft=scss
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap gd <Plug>(go-def-tab)
  augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
  augroup end
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

  " Vim-Go related Settings
  "let g:go_errcheck_bin="/Users/vinitkumar/go/bin/errcheck"
  "let g:go_golint_bin="/Users/vinitkumar/go/bin/golint"
  let g:go_fmt_command = "goimports"
  let g:go_fmt_autosave = 1
  let g:github_upstream_issues = 1
  let g:go_disable_autoinstall = 0
  let g:jsx_ext_required = 0
  let g:typescript_compiler_binary = 'tsc'
" }

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
     exe ":NERDTreeClose"
  else
     if (expand("%:t") != '')
        exe ":NERDTreeFind"
     else
        exe ":NERDTreeToggle"
     endif
  endif
endfunction

function! LightlineFilename()
  let filename = expand(@%) !=# '' ? expand(@%) : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

"function! Spotify()
    ":let status = system("osascript " . shellescape(expand("~/applescript/spotify.scpt")))
    "return status
"endfunction

command! Wipe :bufdo BD
command! Node :badd node-repl.js | buffer node-repl.js | Codi javascript
command! Js :set ft=javascript
command! Css :set ft=css

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,package-lock.json

