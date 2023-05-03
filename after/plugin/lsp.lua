local lsp = require('lsp-zero')
local ls = require "luasnip"
lsp.preset('recommended')

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer' })

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    --quickfix
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    lsp.buffer_autoformat()
    vim.keymap.set({ "i", "s" }, "<Tab>", function() ls.jump(1) end, { desc = "LuaSnip forward jump" })
    vim.keymap.set({ "i", "s" }, "<S-Tab>", function() ls.jump(-1) end, { desc = "LuaSnip backward jump" })
end)

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'luasnip', keyword_length = 2 },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer',  keyword_length = 3 },
    }
})


vim.diagnostic.config({
    virtual_text = true
})




-- OLD LSP CONFIG USE FOR REFERENCE
--require('lspconfig').rust_analyzer.setup {
--  settings = {
--    ['rust-analyzer'] = {
--      checkOnSave = {
--        allFeatures = true,
--        overrideCommand = {
--          'cargo', 'clippy', '--workspace', '--message-format=json',
--          '--all-targets', '--all-features'
--        }
--      }
--    }
--  }
--}
--
---- LSP settings.
--
---- Example custom configuration for lua
----
---- nvim-cmp setup
--local cmp = require 'cmp'
--local luasnip = require 'luasnip'
--
--cmp.setup {
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end,
--  },
--  mapping = cmp.mapping.preset.insert {
--    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-f>'] = cmp.mapping.scroll_docs(4),
--    ['<C-Space>'] = cmp.mapping.complete(),
--    ['<CR>'] = cmp.mapping.confirm {
--      behavior = cmp.ConfirmBehavior.Replace,
--      select = true,
--    },
--    ['<Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { 'i', 's' }),
--  },
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  },
--}
