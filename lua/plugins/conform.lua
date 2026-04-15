-- ============================================================
-- Conform (Formatting)
-- ============================================================

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
    },
})

-- Format on save (manual control, better than built-in flag)
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        conform.format({
            bufnr = args.buf,
            timeout_ms = 2000,
            lsp_fallback = true,
        })
    end,
})

-- Manual format keymap
vim.keymap.set({ "n", "v" }, "<leader>f", function()
    conform.format({
        async = true,
        lsp_fallback = true,
    })
end, { desc = "Format buffer" })
