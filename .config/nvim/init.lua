require('andrewsuh.base')
require('andrewsuh.highlights')
require('andrewsuh.maps')
require('andrewsuh.plugins')
require('andrewsuh.colorscheme')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
	require('andrewsuh.macos')
end
if is_win then
	require('andrewsuh.windows')
end
