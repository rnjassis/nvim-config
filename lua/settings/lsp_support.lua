require("mason").setup()
-- Required: npm and python
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "tsserver", "html", "pyright" }
})
require("lsp_signature").setup({
    bind = true,
    handler_opts = {
        border = "rounded"
    }
})
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        -- ignore 'code completion' for plain text
        { name = 'nvim_lsp',
            entry_filter = function(entry,ctx)
                local kind = cmp.lsp.CompletionItemKind[entry:get_kind()]
                if kind == "Text" then
                    return false
                else
                    return true
                end
            end
        },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        })
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require('lspconfig').html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    opts = opts
}

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    opts = opts
}

require("lspconfig").tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    opts = opts
}

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    opts = opts
}

