" get group highlight value by name and type
function! GetGroupHighlightColor(group_name, type)
  return synIDattr(synIDtrans(hlID(a:group_name)), a:type)
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

function! GoyoLeave()
  " fix colros
  hi VertSplit guifg=bg guibg=bg
  execute 'source' . fnamemodify(expand("$MYVIMRC"), ":p:h") . '/statusline.vim'
  if bufwinnr('coc-explorer') > 0
    execute 'CocCommand explorer --toggle'
  endif
endfunction

" if can't find file use this function to transform alias import to regular
" path: UI/Table/Header.jsx -> src/ui/Table/Header.jsx
function! AliasImports(file)
  let l:path_array=split(a:file, '/')
  let l:file_replaced= a:file =~ '^\.' ? a:file : 'src/' . tolower(path_array[0]) . '/' . join(path_array[1:], '/')
  let l:file_name_js=l:file_replaced . '/' . path_array[len(path_array) - 1] . '.js'
  let l:file_name_jsx=l:file_replaced . '/' . path_array[len(path_array) - 1] . '.jsx'
  let l:file_name_index=l:file_replaced . '/index.js'
    if (filereadable(l:file_name_js))
      " echo l:file_name_js
      return l:file_name_js
    endif
    if (filereadable(l:file_name_jsx))
      " echo l:file_name_jsx
      return l:file_name_jsx
    endif
    if (filereadable(l:file_name_index))
      " echo l:file_name_index
      return l:file_name_index
    endif
  " echo l:file_replaced
  return l:file_replaced
endfunction

function! CustomGF(file)
  echo a:file
  let l:file_path = AliasImports(a:file)

  exe 'e' l:file_path
endfunction
