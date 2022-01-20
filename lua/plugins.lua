function str_to_bool(str)
  true_str={["true"] = true, ["1"] = true}
  return true_str[str] ~= nil
end

function has_icons()
  if vim.env.ENABLE_NERD_ICONS ~= nil then
    return str_to_bool(vim.env.ENABLE_NERD_ICONS)
  end

  return vim.fn.has('gui_running') == 1
         or (vim.env.TERM ~= nil and vim.env.TERM:match('^linux') == nil)
end

return require'packer'.startup(function(use)
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

  -- Buffer line
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    cond = has_icons,
    config = function() require'bufferline'.setup{} end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      local trouble_config = {}
      if not has_icons() then
        trouble_config = {
          icons = false,
          fold_open = "v", -- icon used for open folds
          fold_closed = ">", -- icon used for closed folds
          indent_lines = false, -- add an indent guide below the fold icons
          signs = {
            -- icons / text used for a diagnostic
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
          },
          use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
          }
      end
      require'trouble'.setup(trouble_setup)
    end
  }
  -- Status line
  use {
    'feline-nvim/feline.nvim',
    config = function()
      local feline_config = {}
      if not has_icons() then
        feline_config['preset'] = 'noicon'
      end

      require'feline'.setup(feline_config)
    end
  }

  -- Vim dispatch
  use 'tpope/vim-dispatch'

  -- Fugitive for Git
  use 'tpope/vim-fugitive'

  -- EditorConfig for Vim
  use 'editorconfig/editorconfig-vim'

  -- To define keymappings
  use 'svermeulen/vimpeccable'
end)

