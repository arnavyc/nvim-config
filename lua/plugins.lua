return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- LSP and completion
  -- use 'neovim/nvim-lspconfig'
  -- use 'nvim-lua/completion-nvim'

  -- Color scheme
  if tonumber(vim.api.nvim_get_option('t_Co')) > 16 then
    use {'kaicataldo/material.vim', branch = 'main'}
  end

  -- Sensible defaults
  use 'tpope/vim-sensible'

  -- Lightline
  use 'itchyny/lightline.vim'

  -- coc.nvim
  if vim.fn.executable('node') then use 'neoclide/coc.nvim' end

  -- Vim dispatch
  use 'tpope/vim-dispatch'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'

  -- EditorConfig for Vim
  use 'editorconfig/editorconfig-vim'
end)

