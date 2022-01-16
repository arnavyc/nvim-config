if tonumber(vim.api.nvim_get_option('t_Co')) > 16 then
  vim.o.termguicolors = true
  vim.g.material_style = "deep ocean"

  vim.cmd 'colorscheme material'
end
