local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- link to mode string values
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- remap space as leader key
keymap.set('', '<Space>', '<NOP>', opts)
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- turn off highlighting
keymap.set('n', '<Leader>nh', ':noh<CR>', opts)

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

-- navtigate buffers
keymap.set('n', '<S-l>', ':bnext<CR>', opts)
keymap.set('n', '<S-h>', ':bprevious<CR>', opts)
-- delete current buffer without closing split
keymap.set('n', '<Leader>bd', ':bp|bd #<CR>', opts)

-- Split window
keymap.set('n', 'ss', ':split<CR><C-w>j', opts)
keymap.set('n', 'sv', ':vsplit<CR><C-w>l', opts)
keymap.set('n', 'sc', ':close<CR>', opts)
-- Switch focus window
keymap.set('', 'sh', '<C-w>h', opts)
keymap.set('', 'sk', '<C-w>k', opts)
keymap.set('', 'sj', '<C-w>j', opts)
keymap.set('', 'sl', '<C-w>l', opts)
-- Resize window
keymap.set('n', 'se', '<C-w>=', opts)
keymap.set('n', 's<left>', '<C-w><', opts)
keymap.set('n', 's<right>', '<C-w>>', opts)
keymap.set('n', 's<up>', '<C-w>+', opts)
keymap.set('n', 's<down>', '<C-w>-', opts)
