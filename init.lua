-- Map leader to space
vim.g.mapleader = ' '

local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data') ..
                       '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

vim.cmd 'packadd packer.nvim'

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Another option is to groups configuration in one folder
require('config')

-- OR you can invoke them individually here
-- require('config.colorscheme')  -- color scheme
-- require('config.completion')   -- completion
-- require('config.fugitive')     -- fugitive

