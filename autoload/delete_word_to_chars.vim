function! delete_word_to_chars#delete_word(keywords, motion) abort
  let l:isk_save = &l:iskeyword
  for l:keyword in split(a:keywords, '\zs')
    execute "setlocal iskeyword-=" . l:keyword
  endfor
  try
    if col('.') == col('$') - 1
      exec "normal! a\<C-w>\<right>"
    else
      exec "normal! i\<C-w>\<right>"
    end
  catch
    return 'echoerr '.string(v:exception)
  finally
    let &l:iskeyword = l:isk_save
  endtry
endfunction
