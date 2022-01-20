local vimp = require 'vimp'

-- Clear highlights
-- utils.map('n', '<C-l>', '<cmd>noh<CR>')

-- jk to escape
-- utils.map('i', 'jk', '<Esc>')

-- folke/trouble.nvim
vimp.nnoremap({'silent'}, '<leader>xx', '<cmd>TroubleToggle<cr>')
vimp.nnoremap({'silent'}, '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vimp.nnoremap({'silent'}, '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
vimp.nnoremap({'silent'}, '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
vimp.nnoremap({'silent'}, '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
vimp.nnoremap({'silent'}, 'gR', '<cmd>TroubleToggle lsp_references<cr>')
