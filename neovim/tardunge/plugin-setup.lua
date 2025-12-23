-- Setup plugins with simple configs. Complex configs go to their respective files.
require("nvim-web-devicons").setup({
    default = true,
})

require("lualine").setup({
    options = {
        theme = "nord",
    },
})

require("nvim-tree").setup({
    filters = {
        dotfiles = true,
    },
})

require("gitsigns").setup()

require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    indent = {
        enable = true,
    },
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
        border = "rounded",
    },
})

require("cmp").setup({
    sources = {
        { name = "nvim_lsp" },
    },
})

-- Clipboard configuration.
require("yanky").setup({
    ring = {
        history_length = 100,
        storage = "shada",
        -- storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
        sync_with_numbered_registers = true,
        cancel_event = "update",
        ignore_registers = { "_" }, -- black hole register. use this to ignore_registers.
        update_register_on_cycle = false,
    },
    picker = {
        select = {
            action = nil, -- nil to use default put action
        },
        telescope = {
            use_default_mappings = true, -- if default mappings should be used
            mappings = nil,              -- nil to use default mappings or no mappings (see `use_default_mappings`)
        },
    },
    system_clipboard = {
        sync_with_ring = true,
        clipboard_register = nil,
    },
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
    },
    preserve_cursor_position = {
        enabled = true,
    },
    textobj = {
        enabled = true,
    },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig")["pylsp"].setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 88,
                },
                mccabe = {
                    threshold = 25,
                },
                mypy = {
                    enabled = false,
                },
            },
        },
    },
    capabilities = capabilities,
})

require("lspconfig")["rust_analyzer"].setup({
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                allFeatures = true,
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",     -- Run Clippy on save
            },
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = capabilities,
})


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                -- vim.lsp.buf.formatting_sync()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.mypy,
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.isort,
    },
    on_attach = on_attach,
})
