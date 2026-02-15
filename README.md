# delete-word-to-chars.nvim

Neovim plugin that remaps `<C-w>` in insert mode to delete backward to specific character boundaries instead of using Vim's default word deletion.

By default, `_` and `:` are removed from the keyword character set so that `<C-w>` stops at these characters.

## Configuration

```lua
require("delete-word-to-chars").setup({
  -- Characters to remove from iskeyword (deletion stops at these)
  remove_keyword = { "_", ":" },
  -- Characters to add to iskeyword
  add_keyword = {},
})
```
