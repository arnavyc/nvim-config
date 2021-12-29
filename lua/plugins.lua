return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- UI to select things (files, grep results, open buffers...)
  --use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  -- use 'nvim-lua/completion-nvim'

  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Color scheme
  if tonumber(vim.api.nvim_get_option('t_Co')) > 16 then
    use {'kaicataldo/material.vim', branch = 'main'}
  end

  -- Sensible defaults
  use 'tpope/vim-sensible'

  -- Lightline
  use 'itchyny/lightline.vim'

  -- coc.nvim
  --if vim.fn.executable('node') then use 'neoclide/coc.nvim' end

  -- Vim dispatch
  use 'tpope/vim-dispatch'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'

  -- EditorConfig for Vim
  use 'editorconfig/editorconfig-vim'

end)

