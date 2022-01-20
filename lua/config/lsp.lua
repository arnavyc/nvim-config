-- LSP settings
local vimp = require 'vimp'
local nvim_lsp = require 'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vimp.add_buffer_maps(bufnr, function ()
    vimp.nnoremap({'silent'}, 'gD', vim.lsp.buf.declaration)
    vimp.nnoremap({'silent'}, 'gd', vim.lsp.buf.definition)
    vimp.nnoremap({'silent'}, 'K', vim.lsp.buf.hover)
    vimp.nnoremap({'silent'}, 'gi', vim.lsp.buf.implementation)
    vimp.nnoremap({'silent'}, '<C-k>', vim.lsp.buf.signature_help)
    vimp.nnoremap({'silent'}, '<leader>wa', vim.lsp.buf.add_workspace_folder)
    vimp.nnoremap({'silent'}, '<leader>wr', vim.lsp.buf.remove_workspace_folder)
    vimp.nnoremap({'silent'}, '<leader>wl', function ()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    vimp.nnoremap({'silent'}, '<leader>D', vim.lsp.buf.type_definition)
    vimp.nnoremap({'silent'}, '<leader>rn', vim.lsp.buf.rename)
    vimp.nnoremap({'silent'}, 'gr', vim.lsp.buf.references)
    vimp.nnoremap({'silent'}, '<leader>ca', vim.lsp.buf.code_action)
    vimp.nnoremap({'silent'}, '<leader>e', vim.diagnostic.open_float)
    vimp.nnoremap({'silent'}, '[d', vim.lsp.diagnostic.goto_prev)
    vimp.nnoremap({'silent'}, ']d', vim.lsp.diagnostic.goto_next)
    vimp.nnoremap({'silent'}, '<leader>q', vim.lsp.diagnostic.set_loclist)
    vimp.nnoremap({'silent'}, '<leader>so', require('telescope.builtin').lsp_document_symbols)
  end)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  if vim.fn.executable(lsp) then
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

--vim.lsp.diagnostic.show_line_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)

--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float()]]
--vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]

