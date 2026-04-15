-- ============================================================
-- LSP (Neovim 0.12 native)
-- ============================================================
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup Mason
require("mason").setup()
local mason_registry = require("mason-registry")

local function ensure_installed(servers)
	for _, name in ipairs(servers) do
		local ok, pkg = pcall(mason_registry.get_package, name)
		if ok and not pkg:is_installed() then
			pkg:install()
		end
	end
end

ensure_installed({
	"lua-language-server",
	"pyright",
	"vtsls",
	"ruff",
})

-- Install servers via vim.pack (if needed)
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

-- ============================================================
-- LSP Attach (keymaps per buffer)
-- ============================================================
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local buf = event.buf
		-- Attach lsp_signature when LSP attaches
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
			floating_window = true,
			floating_window_above_cur_line = true,
			hint_enable = false, -- disable virtual text hints (can be distracting)
			hint_prefix = "🐼 ",
			hi_parameter = "LspSignatureActiveParameter",
			max_height = 12,
			max_width = 80,
			transparency = nil,
			timer_interval = 200,
		}, buf)

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
		end
		map("gd", vim.lsp.buf.definition, "Goto Definition")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("gi", vim.lsp.buf.implementation, "Goto Implementation")
		map("gr", vim.lsp.buf.references, "References")
		map("K", vim.lsp.buf.hover, "Hover")
		map("<leader>rn", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("<leader>cf", function()
			vim.lsp.buf.format({ async = true })
		end, "Format")
	end,
})

-- ============================================================
-- Configure servers
-- ============================================================

-- Lua
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly", -- only check open files
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic", -- change to "off" if you want it even lighter
			},
		},
	},
})

vim.lsp.config("ruff", {})

-- TypeScript / JavaScript
vim.lsp.config("vtsls", {
	capabilities = capabilities,
})

-- Enable servers ()
vim.lsp.enable({
	"lua_ls",
	"pyright", -- ← new one
	"vtsls",
	"ruff",
})

-- ============================================================
-- LSP UI (rounded borders)
-- ============================================================
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
	config = config or {}
	config.border = "rounded"
	return vim.lsp.handlers.hover(_, result, ctx, config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, ctx, config)
	config = config or {}
	config.border = "rounded"
	return vim.lsp.handlers.signature_help(_, result, ctx, config)
end
