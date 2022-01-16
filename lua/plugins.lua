return require'packer'.startup(function()
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- UI to select things (files, grep results, open buffers...)
  --use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- LSP and completion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Color scheme
  if tonumber(vim.api.nvim_get_option('t_Co')) > 16 then
    use 'marko-cerovac/material.nvim'
  end

  -- Sensible defaults
  use 'tpope/vim-sensible'

  local has_icons = true
  if (vim.env.TERM ~= nil and string.match(vim.env.TERM, '^linux') ~= nil) then
    local has_icons = false
  end

  -- Buffer line
  if has_icons then
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'bufferline'.setup{} end
    }
  end

  -- Status line
  use {
    'feline-nvim/feline.nvim',
    config = function() require'feline'.setup{} end
  }

  -- Vim dispatch
  use 'tpope/vim-dispatch'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'

  -- EditorConfig for Vim
  use 'editorconfig/editorconfig-vim'

end)

