local utils = require('utils')

if tonumber(vim.api.nvim_get_option('t_Co')) > 16 then
  utils.opt('o', 'termguicolors', true)
  vim.cmd 'colorscheme material'
end
