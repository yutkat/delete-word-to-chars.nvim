function! delete_word_to_chars#delete_word(keywords, motion) abort
  let l:isk_save = &l:iskeyword
  setlocal iskeyword-=a:keywords
  execute "setlocal iskeyword=" . a:keywords
  try
    execute "normal! " . a:motion
  catch
    return 'echoerr '.string(v:exception)
  finally
    let &l:iskeyword = l:isk_save
  endtry
endfunction
