call plug#begin('~/.vim/plugged')

" [DRACULA THEME IS LOVE]: {
  "-----------------------------------
  Plug 'dracula/vim', {'as': 'dracula'}
  "-----------------------------------
" }
"
"
"
" [Best status line plugin, super minimal]: {
  "--------------------------
  Plug 'itchyny/lightline.vim'
  "--------------------------
  function! LightlineFilename()
    let filename = expand(@%) !=# '' ? expand(@%) : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
  endfunction

  let g:lightline = {
    \'colorscheme': 'one',
    \'component_function': {
      \'filename': 'LightlineFilename',
    \},
  \}
  let g:lightline.component_expand = {
    \'linter_checking': 'lightline#ale#checking',
    \'linter_warnings': 'lightline#ale#warnings',
    \'linter_errors': 'lightline#ale#errors',
    \'linter_ok': 'lightline#ale#ok',
  \}
  let g:lightline.component_type = {
    \'linter_checking': 'left',
    \'linter_warnings': 'warning',
    \'linter_errors': 'error',
    \'linter_ok': 'left',
  \}
  let g:lightline.active = {
    \'right': [
      \['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \['lineinfo'],
      \['percent'],
      \['fileencoding', 'filetype']
    \],
  \'left': [
    \['mode', 'paste'],
    \['readonly', 'filename']
    \],
  \}
" }
"
"
"
" [Autocompletion and IDE like integrations, works with TSServer]: {
  "---------------------------
  Plug 'Valloric/YouCompleteMe'
  "---------------------------
  let g:ycm_autoclose_preview_window_after_insertion = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_key_list_stop_completion = ['<C-l>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-k>']
  let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-j>']

" }
"
"
"
" [Asynchronous Lint Engine]: {
  "---------------------------
  Plug 'w0rp/ale'
  Plug 'maximbaz/lightline-ale' "lightlin integratin
  "---------------------------
  "let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 2
  let g:ale_python_flake8_args="--ignore=E501"

  let g:ale_linters = {
    \'javascript': ['eslint'],
    \'swift': ['swiftlint'],
    \'python': ['mypy'],
    \'typescript': ['tslint'],
  \}

  let g:ale_lint_on_save = 1
  let g:ale_lint_on_text_changed = 1
  let g:ale_sign_error = ' '
  let g:ale_sign_warning = ' '
" }
"
"
"
" [file explorer tree]: {
  "---------------------------
  Plug '~/.vim/bundle/nerdtree'
  "---------------------------
  let g:NERDTreeDirArrowExpandable = ''
  let g:NERDTreeDirArrowCollapsible = ''
  let g:NERDSpaceDelims = 1
  let g:NERDDefaultAlign = 'left'
  function! NERDTreeToggleInCurDir()
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
" }
"
"
" [window size managment]: {
  "-----------------------
  Plug 'roman/golden-ratio'
  "-----------------------
  let g:golden_ratio_exclude_nonmodifiable = 1
  let g:golden_ratio_autocommand = 0
" }
"
"
"
" [REPL]: {
  "------------------------
  Plug 'metakirby5/codi.vim'
  "------------------------
  let g:codi#autoclose = 1
  let g:codi#width = 80
  let g:codi#rightsplit = 0
" }
"
"
"
" [Lines indentation]: {
  "------------------------
  Plug 'Yggdroot/indentLine'
  "------------------------
  let g:indentLine_fileTypeExclude = ['nerdtree']
  let g:indentLine_leadingSpaceChar = '·'
  let g:indentLine_leadingSpaceEnabled = 1
  let g:indentLine_enabled= 0
" }
"
"
"
" [Spell checking]: {
  "-------------------------
  Plug 'kamykn/spelunker.vim'
  "-------------------------
  let g:spelunker_disable_auto_group = 1
  " specify custom autogroup with file types you want to check:
  augroup spelunker
    autocmd!
    autocmd BufWinEnter,BufWritePost ,*.js,*.jsx,*.json,*.md call spelunker#check()
  augroup END
" }
"
"
"
" [git file diff status on gutter]: {
  "---------------------------
  Plug 'airblade/vim-gitgutter'
  "---------------------------
  let g:gitgutter_sign_added = ' '
  let g:gitgutter_sign_modified = ' '
  let g:gitgutter_sign_removed = ' '
  let g:gitgutter_sign_removed_first_line = ' '
  let g:gitgutter_sign_modified_removed = ' '
" }
"
"
"
  Plug 'tpope/vim-fugitive' " git
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'wakatime/vim-wakatime' "wakatime tracker
  Plug 'mattn/webapi-vim' "Basic HTTP OAuth JSON Parser etc.
  Plug 'junegunn/fzf.vim'  "Fast searches
  Plug '/usr/local/opt/fzf'
  Plug 'tpope/vim-surround' "you sould know this one
  Plug 'qpkorr/vim-bufkill' "better buffer kill
  Plug 'scrooloose/nerdcommenter' "easy commenting
  Plug 'jiangmiao/auto-pairs' "insert or delete brackets, parens, quotes in pair.
  Plug 'easymotion/vim-easymotion' "you should know this
  Plug 'chrisbra/unicode.vim'
  Plug 'mhinz/vim-startify' "better vim startup screen
  Plug 'junegunn/goyo.vim' "ZEN mode
  " Plug 'tmux-plugins/vim-tmux-focus-events'
  " Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
  " Plug 'editorconfig/editorconfig-vim' git magic, no need for now
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
"
"-------------------------------------------------------------------
"-------------------------------------------------------------------
"
" [UI setup]: {
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let g:drc = {
    \'gui': {
      \'normal': '#f8f8f3',
      \'magenta': '#ff79c6',
      \'purple': '#bd93f9',
      \'blue': '#6272a4',
      \'grey': '#3e4452'
    \},
    \'cterm': {
      \'normal': '231',
      \'magenta': '212',
      \'purple': '141',
      \'blue': '61',
    \}
  \}
  let g:devicons_colors = {
    \'blue': ['', ''],
  \}
  set termguicolors
  set background=dark
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar
  set laststatus=2
  set cursorline
  color dracula
  " tiny separator
  set fillchars+=vert:⎹
  " set fillchars+=vert:⎸
  hi foldcolumn guibg=bg
  "this fixes nerdtree partial highlight in neovim
  " hi NERDTreeFile guibg=none
  exe 'hi VertSplit guibg='drc.gui.blue.' guifg=bg'
  exe 'hi Directory guifg='drc.gui.normal.' ctermfg='drc.cterm.normal
  hi Directory gui=bold cterm=bold
  function! DeviconsColors(config)
    let colors = keys(a:config)
    augroup devicons_colors
      autocmd!
      for color in colors
        exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:drc.gui[color].' ctermfg='.g:drc.cterm[color]
        exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
      endfor
    augroup END
  endfunction
  call DeviconsColors(g:devicons_colors)
" }


" [Keys, mappings]: {
  " faster enter command
  nnoremap ; :
  " Toggle between normal and relative numbering.
  nnoremap <leader>r :call NumberToggle()<cr>
  " spacemacs like keys
  let mapleader=" "
  map <C-p> <Nop>
  map <C-n> <Nop>
  " vimrc
  map <leader>fed :e $MYVIMRC<CR>
  map <leader>feR :source $MYVIMRC<CR>

  imap <C-p> <Nop>
  imap <C-k> <Nop>

  noremap <Leader>pt :call NERDTreeToggleInCurDir()<CR>
  noremap <Leader>sc :nohl<CR>
  noremap <Leader>pf :GFiles<CR>
  noremap <Leader>ps :Ag!<CR>
  noremap <Leader>pS :Ag! <cword><CR>
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
  noremap <Leader>Tz :Goyo 140<CR>

  nnoremap <leader>Tm :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

  vnoremap <TAB> :YcmCompleter Format<CR>
  vnoremap <Leader>ps :<C-u>Agv!<CR>
  vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
  " dont loose selection
  vmap < <gv
  vmap > >gv
  " Copy and paste from system clipboard
  vmap <Leader>sy "+y
  vmap <Leader>d "+d

  nmap <Leader>sp "+p
  nmap <Leader>sP "+P
  nmap <silent> <Leader>ep <Plug>(ale_previous_wrap)
  nmap <silent> <Leader>en <Plug>(ale_next_wrap)
  " maximize window
  nmap <Leader>wm <Plug>(golden_ratio_resize)
" }
"
"
" [per filetype settings]: {
  let g:jsx_ext_required = 0
  let g:typescript_compiler_binary = 'tsc'
  autocmd FileType javascript nmap <buffer> gf :YcmCompleter GoTo<CR>
  autocmd FileType javascript nmap <buffer> gd :YcmCompleter GoToDeclaration<CR>
  autocmd FileType javascript nmap <buffer> gr :YcmCompleter GoToReferences<CR>
  autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd Filetype gitcommit setlocal textwidth=72
  autocmd FileType go set sw=4
  autocmd FileType go set tabstop=4
  autocmd FileType go set sts=0
  autocmd FileType go set expandtab
  autocmd FileType go set smarttab
  autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType p/ython setlocal expandtab sw=4 ts=4 sts=4
  autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
  autocmd FileType c setlocal expandtab sw=2 ts=2 sts=2
  autocmd BufNewFile,BufReadPost *.jade set filetype=pug
  autocmd FileType jade setlocal expandtab sw=2 ts=2 sts=2
  augroup filetype
   au! BufRead,BufNewFile *.proto setfiletype proto
  augroup end
  autocmd FileType css setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType css set ft=scss
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType less setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }
"
"
"
" [FZF custom setup]: {
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
" }

" [general settings]: {
  set diffopt+=iwhite
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
  " set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
  set list
  set listchars=tab:›\ ,trail:·

  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.
  set autoread            " If file updates, load automatically.

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

  if has('autocmd')
    filetype plugin indent on
  endif

  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
  if has('path_extra')
    setglobal tags-=./tags tags^=./tags;
  endif

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

  "exit vim if NERDTree is last buffer
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,package-lock.json
" }
"
"
"
" [Functions]: {
"
" Relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

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
" }
"
"
"
" [custom commands]: {
  command! Wipe :bufdo BD "Wipe all buffers
  command! Node :badd node-repl.js | buffer node-repl.js | Codi javascript "Start node repl with Codi
  command! Js :set ft=javascript
  command! Css :set ft=css
" }

