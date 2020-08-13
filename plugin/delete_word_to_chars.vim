if exists('g:loaded_delete_word_to_chars')
  finish
endif
let g:loaded_delete_word_to_chars = 1

if !exists("g:disable_delete_word_to_chars_mappings")
  inoremap <silent> <C-w> <Esc>:call delete_word_to_chars#delete_word('_:')<CR>
endif

