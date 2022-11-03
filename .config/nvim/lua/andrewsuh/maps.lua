local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- link to mode string values
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- remap space as leader key
keymap.set('', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- 'kj' as escape
keymap.set({ 'i', 'c' }, 'kj', '<Esc>', opts)

-- disable arrow keys
keymap.set({ 'n', 'v' }, '<Up>', '<NOP>', opts)
keymap.set({ 'n', 'v' }, '<Down>', '<NOP>', opts)
keymap.set({ 'n', 'v' }, '<Left>', '<NOP>', opts)
keymap.set({ 'n', 'v' }, '<Right>', '<NOP>', opts)

-- indent - stay in visual mode
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- Increment/decrement
keymap.set('n', '+', '<C-a>', opts)
keymap.set('n', '-', '<C-x>', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', opts)

-- New tab
keymap.set('n', 'te', ':tabedit', opts)

-- navtigate buffers
keymap.set('n', '<S-l>', ':bnext<CR>', opts)
keymap.set('n', '<S-h>', ':bprevious<CR>', opts)

-- open file explorder
keymap.set('n', '<Leader>e', ':Lex 30<CR>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', opts)
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', opts)
-- Switch focus window
keymap.set('', 'sh', '<C-w>h', opts)
keymap.set('', 'sk', '<C-w>k', opts)
keymap.set('', 'sj', '<C-w>j', opts)
keymap.set('', 'sl', '<C-w>l', opts)
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><', opts)
keymap.set('n', '<C-w><right>', '<C-w>>', opts)
keymap.set('n', '<C-w><up>', '<C-w>+', opts)
keymap.set('n', '<C-w><down>', '<C-w>-', opts)
