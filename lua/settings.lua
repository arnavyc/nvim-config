local utils = require('utils')

local indent_size = 2

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
vim.opt.expandtab = true
vim.opt.shiftwidth = indent_size
vim.opt.smartindent = true
vim.opt.tabstop = indent_size
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.scrolloff = 4
vim.opt.shiftround = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = 'list:longest'
vim.opt.number = true
-- vim.opt.clipboard = 'unnamed,unnamedplus'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

-- sheerun/vim-polyglot
vim.g.polyglot_disable = {
  'c.plugin', 'cpp.plugin', 'javascript.plugin', 'typescript.plugin', 'sensible'
}

-- itchyny/lightline.vim
vim.g.lightline = {
  colorscheme = 'material_vim',
  active = {
    left = {
      {'mode', 'paste'}, {
        'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename',
        'modified'
      }
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead',
    cocstatus = 'coc#status'
    -- currentfunction = 'CocCurrentFunction'
  }
}

-- editorconfig/editorconfig-vim
-- Exclude patterns to ensure plugin works well with vim-fugitive
vim.g.EditorConfig_exclude_patterns = {'fugitive://.*'}

-- Disable Editorconfig for git commits
vim.cmd [[au FileType gitcommit let b:EditorConfig_disable = 1]]

-- neoclide/coc.nvim
--vim.g.coc_global_extensions = {
--  'coc-clangd', 'coc-tag', 'coc-css', 'coc-html', 'coc-json', 'coc-jest',
--  'coc-prettier', 'coc-tsserver', 'coc-vimlsp', 'coc-sql', 'coc-db',
--  'coc-snippets'
--}

-- set Material theme
if tonumber(vim.api.nvim_get_option('t_Co')) > 16 then
  vim.g.material_theme_style = 'ocean'
end

