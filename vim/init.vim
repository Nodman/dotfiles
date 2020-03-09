set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

call plug#begin('~/.vim/plugged')
" [Status line plugin, super minimal]: {
  "--------------------------
  Plug 'itchyny/lightline.vim'
  " lightline coc integration
  Plug '~/.vim/bundle/lightline-coc'
  Plug 'macthecadillac/lightline-gitdiff'
  "--------------------------
  let g:lightline#coc#indicator_warnings = ' '
  let g:lightline#coc#indicator_errors = ' '
  let g:lightline_gitdiff#indicator_modified = '~'

  function! LightlineFilename()
    let filename = expand(@%)
    let length = strlen(filename)

    if length > 30
      let filename = '...' . '/' . expand("%:t")
    endif

    let name = filename !=# '' ? filename : '[No Name]'
    let modified = &modified ? ' +' : ''
    return name . modified
  endfunction

  function! LightlineGitBtanch()
    let branch = fugitive#head()
    return branch !=# '' ? ' ' . branch : ''
  endfunction

  let g:lightline = {
    \'colorscheme': 'one',
    \'component_function': {
      \'filename': 'LightlineFilename',
      \'gitbranch': 'LightlineGitBtanch',
    \},
  \}

  let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#coc#warnings',
      \  'linter_errors': 'lightline#coc#errors',
      \  'gitdiff': 'lightline#gitdiff#get',
      \ }
  let g:lightline.component_type = {
      \  'linter_warnings': 'warning',
      \  'linter_errors': 'error',
      \  'gitdiff': 'middle',
      \ }

  let g:lightline.active = {
    \'right': [
      \['linter_errors', 'linter_warnings'],
      \['lineinfo'],
      \['percent'],
      \['gitbranch', 'fileencoding', 'filetype']
    \],
    \'left': [
      \['mode', 'paste'],
      \['readonly', 'filename', 'stat', 'gitdiff']
    \],
  \}
  let g:lightline.active = {
    \'right': [
      \['lineinfo'],
      \['percent'],
      \['linter_errors', 'linter_warnings', 'gitbranch', 'fileencoding', 'filetype']
    \],
    \'left': [
      \['mode', 'paste'],
      \['readonly', 'filename', 'stat', 'gitdiff']
    \],
  \}
" }
"
"
" [COC: YCM/ALE Alternative, autocompletion linting and more]: {
  "---------------------------
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "---------------------------
  " if hidden is not set, TextEdit might fail.
  set hidden
  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup
  "
  " " You will have bad experience for diagnostic messages when it's default
  " 4000.
  set updatetime=300

  "Close preview window when completion is done.
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  "
  " noremap <expr> <C-n> pumvisible() ? "" : "\<C-n>"
  imap <C-p> <Nop>
  imap <C-n> <Nop>
  " inoremap <expr> <C-p> pumvisible() ? "" : "\<C-p>"
  " inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
  "
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <silent><expr> <C-j>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<C-j>" :
        \ coc#refresh()
  inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <cl> to confirm completion, `<C-g>u` means break undo chain at current position.
  inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  " Remap for format selected region
  xmap <TAB>  <Plug>(coc-format-selected)
  nmap <TAB>  <Plug>(coc-format-selected)
  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " " Do default action for previous item.
  " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

	nnoremap <expr><C-j> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-j>"
	nnoremap <expr><C-k> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-k>"
" }
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
  let g:indentLine_fileTypeExclude = ['nerdtree', 'json']
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
  " set spellfile=~/.vim/spell/en.utf-8.add
  " set spellfile
  " let g:enable_spelunker_vim = 0
  let g:spelunker_check_type = 1
  let g:spelunker_disable_auto_group = 1
  " specify custom autogroup with file types you want to check:
  augroup spelunker
    autocmd!
    autocmd BufWinEnter,BufWritePost ,*.ts,*.tsx,*.js,*.jsx,*.json,*.md call spelunker#check()
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
" [vim startup screen]: {
" ------------------------
  Plug 'mhinz/vim-startify' "better vim startup screen
" ------------------------
  let g:startify_change_to_dir = 0
" }
"
"
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-fugitive' " git
  " Plug 'leafgarland/typescript-vim'
  " Plug 'ianks/vim-tsx'
  " Plug 'peitalin/vim-jsx-typescript'
  Plug 'mxw/vim-jsx'
  Plug 'wakatime/vim-wakatime' "wakatime tracker
  " Plug 'mattn/webapi-vim' "Basic HTTP OAuth JSON Parser etc.
  Plug 'junegunn/fzf.vim'  "Fast searches
  Plug '/usr/local/opt/fzf'
  Plug 'tpope/vim-surround' "you sould know this one
  Plug 'qpkorr/vim-bufkill' "better buffer kill
  Plug 'scrooloose/nerdcommenter' "easy commenting
  Plug 'jiangmiao/auto-pairs' "insert or delete brackets, parens, quotes in pair.
  Plug 'easymotion/vim-easymotion' "you should know this
  Plug 'chrisbra/unicode.vim'
  " Plug 'junegunn/goyo.vim' "ZEN mode
  " Plug 'tmux-plugins/vim-tmux-focus-events'
  " Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
  " Plug 'editorconfig/editorconfig-vim' git magic, no need for now
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  "
  "
  "
  " [DRACULA THEME IS LOVE]: {
  "-----------------------------------
  Plug 'dracula/vim', {'as': 'dracula'}
  "-----------------------------------
" }
"
"
call plug#end()
"
"-------------------------------------------------------------------
"-------------------------------------------------------------------
"
"
" [UI setup]: {
  " hide statusline for NerdTree
  let g:NERDTreeStatusline = '%#NonText#'
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
      \'grey': '#3e4452',
      \'lightgreen': '#98c379'
    \},
    \'cterm': {
      \'normal': '231',
      \'magenta': '212',
      \'purple': '141',
      \'blue': '61',
      \'gray': '239',
      \'lightgreen': '150'
    \}
  \}


  set termguicolors
  set background=dark
  set guioptions-=m " Removes top menubar
  set guioptions-=T " Removes top toolbar
  set guioptions-=r " Removes right hand scroll bar
  set go-=L " Removes left hand scroll bar
  set laststatus=2
  set cursorline
  colorscheme dracula
  " tiny separator
  " set fillchars+=vert:⎹
  " set fillchars+=vert:⎸

  " remove ~ at the end of the bufer
  set fillchars+=vert: 
  set fcs=eob: 
  hi foldcolumn guibg=bg

  "colors finetune
  exe 'hi VertSplit guibg=bg guifg=bg'
  exe 'hi Directory guifg='.g:drc.gui.normal.' ctermfg='.g:drc.cterm.normal
  exe 'hi NERDTreeCWD guifg='.g:drc.gui.blue.' ctermfg='.g:drc.cterm.blue

  hi NERDTreeCWD gui=bold cterm=bold
  hi Directory gui=bold cterm=bold

  let g:devicons_colors = {
    \'blue': ['', '']
  \}

" }


" [Keys, mappings]: {
  " faster enter command
  nnoremap ; :
  " Toggle between normal and relative numbering.
  nnoremap <Leader>Tn :call NumberToggle()<cr>
  " spacemacs like keys
  let mapleader=" "
  " vimrc
  " map <leader>fed :e ~/.vimrc<CR>
  " map <leader>feR :source ~/.vimrc<CR>
  map <leader>fed :e $MYVIMRC<CR>
  map <leader>feR :source $MYVIMRC<CR>

  noremap <Leader>ef :echo expand(@%)<CR>

  noremap <Leader>pt :call NERDTreeToggleInCurDir()<CR>
  noremap <Leader>sc :nohl<CR>
  noremap <Leader>pf :GFiles<CR>
  noremap <Leader>ps :Ag!<CR>
  noremap <Leader>pS :Ag! <C-R><C-W><CR>
  noremap <Leader>ff :Files<CR>
  noremap <Leader>bb :Buffers<CR>
  noremap <Leader>bs :enew<CR>
  noremap <Leader>bd :BD<CR>
  noremap <Leader>bw :BW<CR>
  " noremap <Leader>bd :bd<CR>
  " noremap <Leader>bw :bw<CR>
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
  " maximize window
  nmap <Leader>wm <Plug>(golden_ratio_resize)
  " GIT hotkeys
  nmap <Leader>gc :Gcommit<CR>
  nmap <Leader>gs :Gstatus<CR>
  nmap <Leader>gb :Gblame<CR>
  nmap <Leader>gd :Gdiff<CR>
  nmap <Leader>gl :Glog<CR>
" }
"
"
" [per filetype settings]: {
  augroup twig_ft
    au!
    autocmd BufNewFile,BufRead .eslintrc set syntax=json
  augroup END
  " autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
  " autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
  let g:jsx_ext_required = 0
  let g:typescript_compiler_binary = 'tsc'
  autocmd FileType typescript.tsx setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType typescriptreact setlocal expandtab sw=2 ts=2 sts=2
  " fix worng highlighting
  autocmd FileType typescriptreact hi! link tsxTagName Keyword
  autocmd FileType typescript setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType javascript setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd Filetype gitcommit setlocal textwidth=72
  autocmd FileType go set sw=4
  autocmd FileType go set tabstop=4
  autocmd FileType go set sts=0
  autocmd FileType go set expandtab
  autocmd FileType go set smarttab
  autocmd FileType json setlocal expandtab sw=2 ts=2 sts=2
  autocmd FileType json syntax match Comment +\/\/.\+$+
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
  set nospell
  " turn off vim own spell
  set diffopt+=iwhite
  set signcolumn=yes
  set rnu
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
  set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,package-lock.json

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

" }
"
"
"
" [Functions]: {
"
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
" Relative numbering
  function! NumberToggle()
    if(&relativenumber == 1)
      set nornu
      set number
    else
      set rnu
    endif
  endfunc

  function! s:DeviconsColors(config)
    let colors = keys(a:config)
    augroup devicons_colors
      autocmd!
      for color in colors
	exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:drc.gui[color].' ctermfg='.g:drc.cterm[color]
	exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
      endfor
    augroup END
  endfunction

  call s:DeviconsColors(g:devicons_colors)

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
"this fixes nerdtree partial highlight in neovim
hi NERDTreeFile guibg=none
