local status, _ = pcall(require, 'lspconfig')
if (not status) then return end

require('andrewsuh.lsp.mason')
require('andrewsuh.lsp.lspconfig')
