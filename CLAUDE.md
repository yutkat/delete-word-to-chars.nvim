# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

delete-word-to-chars.nvim is a Neovim plugin that overrides `<C-w>` in insert mode to delete backward to specific character boundaries rather than using Vim's default word deletion. It manipulates the buffer-local `iskeyword` option temporarily to control what constitutes a word boundary, then restores it after deletion.

## Architecture

Two-file Lua module under `lua/delete-word-to-chars/`:

- **init.lua** — Plugin entry point. `setup(user_conf)` sets an expression keymap on `<C-w>` (insert mode) that temporarily modifies `vim.bo.iskeyword` (removing `_`, `:` by default), performs a delete-backward motion, then restores the original `iskeyword`. Returns different Vim command sequences depending on cursor position (beginning of line, end of line, or mid-word).
- **config.lua** — Merges user config with defaults (`remove_keyword = {"_", ":"}`, `add_keyword = {}`) via `vim.tbl_deep_extend`.

The keymap uses `expr = true` so the function returns a string of Vim keystrokes. Deletions go to the blackhole register (`"_d`).

## Development

No build system, test framework, linter, or CI is configured. The Lua language server is configured via `.nvim/nlsp-settings/sumneko_lua.json` (LuaJIT runtime, `vim` registered as a global).

When editing, load the plugin in Neovim and test `<C-w>` behavior manually in insert mode with various cursor positions and keyword configurations.
