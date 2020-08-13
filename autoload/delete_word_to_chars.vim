function! delete_word_to_chars#delete_word(keywords) abort
  let l:isk_save = &l:iskeyword
  for l:keyword in split(a:keywords, '\zs')
    execute "setlocal iskeyword-=" . l:keyword
  endfor
  try
    echomsg col('.')
    if col('.') == col('$') - 1
      normal! dvb
      startinsert!
    else
      normal! dvb
      startinsert
    end
  catch
    return 'delete-word-to-chars.vim: '.string(v:exception)
  finally
    let &l:iskeyword = l:isk_save
  endtry
endfunction
