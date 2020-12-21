call plug#begin()
  Plug 'scrooloose/nerdcommenter'                   " Easy commenting
  let g:NERDSpaceDelims = 1
"==================================================
  Plug 'airblade/vim-gitgutter'                     " Git gutter status
  let g:gitgutter_sign_added = '┃'
  let g:gitgutter_sign_modified = '┃'
  let g:gitgutter_sign_removed = '┃'
  let g:gitgutter_sign_removed_first_line = '┃'
  let g:gitgutter_sign_modified_removed = '┃'
"==================================================

  Plug 'roman/golden-ratio'                        " Window size management: {
  let g:golden_ratio_exclude_nonmodifiable = 1
  let g:golden_ratio_autocommand = 0
" }
"==================================================
  Plug 'yuezk/vim-js'                              " JS support
  Plug 'maxmellon/vim-jsx-pretty'                  " support for JSX highlighting
  Plug 'HerringtonDarkholme/yats.vim'              " yet another typescript for vim
  Plug 'tpope/vim-fugitive'                        " git features
  Plug 'itchyny/vim-gitbranch'                     " git branch name
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'                          " Fast searches
  Plug 'junegunn/goyo.vim'                         " ZEN mode
  Plug 'tpope/vim-surround'                        " quoting/parenthesizing made simple
  Plug 'jiangmiao/auto-pairs'                      " insert or delete brackets, parens, quotes in pair.
  Plug 'chrisbra/unicode.vim'                      " unicode features
  Plug 'metakirby5/codi.vim'                       " interactive scratchpad
  Plug 'JamshedVesuna/vim-markdown-preview'        " md preview
  Plug 'tpope/vim-rhubarb'                         " GitHub
  Plug 'mbbill/undotree'
  Plug 'wakatime/vim-wakatime'                     " wakatime tracker
"==================================================
  Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Completion and linting
  let g:coc_global_extensions = [
  \  'coc-tsserver',
  \  'coc-json',
  \  'coc-eslint',
  \  'coc-explorer',
  \  'coc-cssmodules',
  \  'coc-stylelintplus',
  \  'coc-highlight',
  \]
  let g:coc_explorer_global_presets = {
  \'simple': {
  \  'content-width-type': 'win-width',
  \  'file-root-template': '[icon] [root]',
  \  'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1][modified][readonly] [linkIcon & 1][link growRight 1 omitCenter 5]'
  \ },
  \'floating': {
  \  'position': 'floating',
  \  'floating-width': 70,
  \  'file-root-template': '[icon] [root]',
  \  'file-child-template': '[git | 2] [selection | clip | 1] [indent][icon | 1] [diagnosticError & 1][filename omitCenter 1][modified][readonly] [linkIcon & 1][link growRight 1 omitCenter 5]'
  \ }
  \}
"==================================================
  Plug 'kamykn/spelunker.vim'                    " SPELL CHECK
  let g:spelunker_check_type = 2
  let g:spelunker_disable_auto_group = 1
" }
"==================================================
  Plug 'dracula/vim', {'as': 'dracula'}            " DRACULA THEME

call plug#end()
"==================================================
" COLOR SCEHEME
colorscheme dracula
set termguicolors                                  " use true colors
"==================================================
" LOAD CONFIG PARTS
source <sfile>:h/statusline.vim
source <sfile>:h/functions.vim
source <sfile>:h/commands.vim

"==================================================
" VARS
let comment_gui_fg_color = GetGroupHighlightColor('Comment', 'fg')
let vim_markdown_preview_github=1
"==================================================
" UI
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"               " support italics inside tmux
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" remove ~ at the end of the bufer
set fcs=eob:\ 
" get comment color and set it for vertical separator
hi VertSplit guifg=bg guibg=bg
" CocErrorHighlight, still can't get curl underline working
hi CocUnderline guifg=red gui=undercurl term=undercurl
hi CocErrorHighlight guifg=pink gui=undercurl,italic term=undercurl
hi CocWarningHighlight ctermfg=yellow guifg=orange gui=undercurl term=undercurl
hi SpellBad  gui=undercurl guisp=red term=undercurl cterm=undercurl
highlight SpelunkerSpellBad cterm=undercurl ctermfg=247 gui=undercurl guifg=#9e9e9e
" tweak coc-explorer colors
hi CocExplorerFileDirectory guifg=#ffffff
hi CocErrorSign guifg=#d1666a
" adjsut paren match style
hi MatchParen cterm=bold gui=bold
execute 'hi CocExplorerFileDirectoryCollapsed guifg=' . comment_gui_fg_color
execute 'hi CocExplorerFileDirectoryExpanded guifg=' . comment_gui_fg_color
execute 'hi CocExplorerFileRootName guifg=' . comment_gui_fg_color

" GENERAL SETTINGS
set pyxversion=3                         " pythonx version
set cursorline                           " highlight current line
set expandtab                            " Insert spaces when TAB is pressed.
set tabstop=2                            " Render TABs using this many spaces.
set shiftwidth=2                         " Indentation amount for < and > commands.
set signcolumn=yes:1                     " enable sign columns
set numberwidth=2                        " linen umbers columns width
set rnu                                  " enable line numbers (relative)
set updatetime=100                       " mainly for cursor hold
set backspace=indent,eol,start           " Allow backspace over everything in insert mode.
set smarttab
set secure
set path+=**                             "allow to search in subdirs
set suffixesadd=.js,.jsx,.scss
set includeexpr=AliasImports(v:fname)
set wildmenu
set shortmess+=c
" set noautoindent                         " I indent my code myself
" set nocindent                            " I indent my code myself
set omnifunc=syntaxcomplete#Complete     " enable completion
set ttimeout                             " enable key sequence timeout
set ttimeoutlen=100                      " 100ms
set hlsearch                             " Highlight search results
"set ignorecase                           " Make searching case insensitive
set smartcase                            " ... unless the query has capital letters
set incsearch                            " Incremental search
set gdefault                             " Use 'g' flag by default with :s/foo/bar/
set magic                                " Use 'magic' patterns (extended regular expressions)
set showmatch                            " Show matching brackets
set nojoinspaces                         " Prevents inserting two spaces after punctuation on a join (J)
set list                                 " enable list chars
set listchars=tab:›\ ,trail:·,extends:>,precedes:<,nbsp:~
set splitbelow                           " Horizontal split below current.
set splitright                           " Vertical split to right of current.
set display+=lastline                    " don't show @ for last line
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,package-lock.json
set nospell
set spellfile=~/.config/nvim/spell/en.utf-8.add
"==================================================
" KEYS
" esc seq
if has('nvim')
  tnoremap <a-a> <esc>a
  tnoremap <a-b> <esc>b
  tnoremap <a-d> <esc>d
  tnoremap <a-f> <esc>f
endif
" set leader to space
let mapleader=" "
inoremap <C-Space> <Nop>
nnoremap <C-Space> <Nop>
" faster enter command
nnoremap ; :
" faster vimrc access
map <leader>fed :e $MYVIMRC<CR>
" reload vim config
map <leader>feR :source $MYVIMRC<CR>
" echo file name
noremap <Leader>ef :echo expand(@%)<CR>
nmap gx :call CustomGF("<C-R><C-W>")<CR>
" reset highlight
noremap <Leader>sc :nohl<CR>
" show and search through git project files
noremap <Leader>pf :GFiles<CR>
" show and search files in WD
noremap <Leader>ff :Files<CR>
" show and search through buffers
noremap <Leader>bb :Buffers<CR>
" search files in WD by visual selection
vnoremap <Leader>ps :<C-u>Agv!<CR>
" search files in WD
noremap <Leader>ps :Ag<CR>
" search files in WD by current word
noremap <Leader>pS :Ag <C-R><C-W><CR>
" exit buffer
noremap <Leader>bd :BD<CR>
" close buffer
noremap <Leader>bw :bw<CR>
" create new buffer
noremap <Leader>bN :badd<space>
" next buffer
noremap <Leader>bn :bn<CR>
" previous buffer
noremap <Leader>bp :bp<CR>
" next tab
noremap <Leader>tn :tabnext<CR>
" previous tab
noremap <Leader>tp :tabprevious<CR>
" duplicate line
noremap <Leader>ld yyp
" close window
noremap <Leader>wd :wd<CR>
" send current buffer to new tab
noremap <Leader>w <C-w>
" split horizontally
noremap <Leader>ws :<C-u>split<CR>
" split vertically
noremap <Leader>wv :<C-u>vsplit<CR>
" resize vertically
noremap <Leader>H :vertical resize +5<CR>
" resize vertically 
noremap <Leader>L :vertical resize -5<CR>
" search selection in buffer
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
" keep selection while indenting
vmap < <gv
vmap > >gv|
" copy paste from/ to system clipboard
vmap <Leader>sy "+y
vmap <Leader>d "+d
nmap <Leader>sp "+p
nmap <Leader>sP "+P
" maximize window
nmap <Leader>wm <Plug>(golden_ratio_resize)
" scroll through command mode with C-j and C-k
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
" scroll through popup window with C-j and C-k
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" map Leader NUM for switching between windows
let win_number = 1
while win_number <= 9
    execute 'nnoremap <Leader>' . win_number . ' :' . win_number . 'wincmd w<CR>'
    let win_number = win_number + 1
endwhile
"exit terminal mode
tnoremap <C-n> <C-\><C-n>
"coc
"highlight color
autocmd CursorHold * silent call CocActionAsync('highlight')

"open explorer
noremap <silent> <space>pt :CocCommand explorer  --preset floating --sources file+<CR>
noremap <silent> <space>pT :CocCommand explorer  --preset simple --sources file+<CR>
" go to type-definition
nmap <silent>gy <Plug>(coc-type-definition)
" go to implementation
nmap <silent>gi <Plug>(coc-implementation)
" go to references
nmap <silent>gr <Plug>(coc-references)
" select completion with C-l
inoremap <expr><C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Actions popup
nnoremap <silent> <space>a  :<C-u>CocAction<cr>
function! s:check_backspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_doc()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_backspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> K :call <SID>show_doc()<CR>
vmap <TAB> <Plug>(coc-format-selected)

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
"==================================================
" EVENTS
autocmd! User GoyoLeave nested call GoyoLeave()
augroup spelunker
  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.ts,*tsx,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

"==================================================
