set noshowcmd
set laststatus=2
hi statusline guibg=NONE
hi statuslinenc guibg=NONE
hi statusline_text guibg=NONE guifg=#d1d1fd
hi statusline_text_right guibg=NONE guifg=#55557a

" let g:branchname_w_icon = ''
let g:last_mode = ''

" function! s:GitBranch()
  " let branchname = gitbranch#name()
  " let g:branchname_w_icon = strlen(branchname) > 0?'  '.branchname.' ':''
" endfunction

function! Modified()
    let modified = &modified ? '   ' : '  '
    return modified 
endfunction

function! BufNum()
  return ' ' . len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, ' ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, ' ' . info['warning'])
  endif
  if (empty(msgs))
    return '  ' . get(g:, 'coc_status', '')
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

function! ModeColors(mode)
  if g:last_mode == a:mode
    return ''
  endif

  let g:last_mode = a:mode
  " Normal mode
  if a:mode == 'n'
    hi mode_color guibg=NONE guifg=#a2e7fc gui=bold
    " Insert mode
  elseif a:mode == 'i'
    hi mode_color guibg=NONE guifg=#ee85cf gui=bold
  " Replace mode
  elseif a:mode == 'R'
    hi mode_color guibg=NONE guifg=#f0b295 gui=bold
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == ""
    hi mode_color guibg=NONE guifg=#ebee85 gui=bold
  " Command mode
  elseif a:mode == 'c'
    hi mode_color guibg=NONE guifg=#85ee91 gui=bold
  " Terminal mode
  elseif a:mode == 't'
    hi mode_color guibg=NONE guifg=#aea3ff gui=bold
  endif

  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" Return a nice mode name
function! ModeName(mode)
  if a:mode == 'n'
    return 'NRM'
  " Insert mode
  elseif a:mode == 'i'
    return 'INS'
  " Replace mode
  elseif a:mode == 'R'
    return 'REP'
  " Visual mode
  elseif a:mode == 'v'
    return 'VIS'
  elseif a:mode == 'V'
    return 'VLN'
  elseif a:mode == ''
    return 'VBL'
  " Command mode
  elseif a:mode == 'c'
    return 'COM'
  " Terminal mode
  elseif a:mode == 't'
    return 'TER'
  endif
endfunction

set statusline=

" Update colors when ya do
set statusline+=%{ModeColors(mode())}

" Mode
set statusline+=\ 
set statusline+=%#mode_color#[\ %{ModeName(mode())}\ ]

"Filename
set statusline+=\ %#statusline_text#%t\ [%n]%{Modified()}%<

"Branchname
" set statusline+=%#statusline_text_right#%{branchname_w_icon}

" Right Side
set statusline+=%=%#statusline_text_right#
set statusline+=%{StatusDiagnostic()}%{get(b:,'coc_current_function','')}\ 
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c\ 

set statusline+=%{BufNum()}
set statusline+=\ •\ \ %{strftime('%H:%M')}

" autocmd! FocusGained,BufEnter * call <SID>GitBranch()
" autocmd! BufEnter,BufWinEnter,WinEnter,CmdwinEnter * call ClearStatusLine('[coc-explorer]-1')
