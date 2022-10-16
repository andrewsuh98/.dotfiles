local keymap = vim.keymap

-- link to mode string values
-- https://github.com/nanotee/nvim-lua-guide#defining-mappings

-- 'kj' as escape
keymap.set({'i', 'v', 'c'}, 'kj', '<Esc>')

-- disable arrow keys
keymap.set({'n', 'v'}, '<Up>', '<NOP>')
keymap.set({'n', 'v'}, '<Down>', '<NOP>')
keymap.set({'n', 'v'}, '<Left>', '<NOP>')
keymap.set({'n', 'v'}, '<Right>', '<NOP>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Switch focus window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
