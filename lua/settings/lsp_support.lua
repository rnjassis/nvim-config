require("mason").setup()
-- Required: npm and python

require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "html", "pyright", "gopls" }
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
        },
    },
}

local util = require "lspconfig/util"
local on_attach = function(_, bufnr)
    local function opts(desc)
        return { noremap = true, buffer=bufnr, desc="LSP " .. desc }
    end
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts "Declaration")
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts "Definition")
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts "Implementation")

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts "Rename")
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts "Code Action")

    vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, opts "References")
    vim.keymap.set('n', '<leader>H', vim.lsp.buf.hover, opts "Hover")
end

local common = {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.config('html', common)
vim.lsp.config('lua_ls', common)
vim.lsp.config('ts_ls', common)

vim.lsp.config('pyright', {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern("__main__.py", ".git"),
    settings = {
        pyright = {
            completeUnimported = true,
            usePlaceholders = true,
        }
    }
})

vim.lsp.config('gopls', {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        pyright = {
            completeUnimported = true,
            usePlaceholders = true,
        }
    }
})

