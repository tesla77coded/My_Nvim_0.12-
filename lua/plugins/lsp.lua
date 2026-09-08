-- ============================================================
-- LSP (Neovim 0.12 native) — Node-free except JS/TS
-- ============================================================
vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
	"lua-language-server", -- Lua, native
	"ruff", -- Rust, Python lint/format
	"ty", -- Rust, Python completions/nav
	"biome", -- Rust, JS/TS lint/format
	"typescript-language-server", -- Node, JS/TS completions/nav (accepted tradeoff)
})

-- ============================================================
-- Root directory resolver — never falls back to nil
-- ============================================================
local function root_with_fallback(markers)
	return function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(fname, markers)
		on_dir(root or vim.fn.getcwd())
	end
end

-- ============================================================
-- LspAttach (keymaps per buffer)
-- ============================================================
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local buf = event.buf
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = { border = "rounded" },
			floating_window = true,
			floating_window_above_cur_line = true,
			hint_enable = false,
			hint_prefix = "🐼 ",
			hi_parameter = "LspSignatureActiveParameter",
			max_height = 12,
			max_width = 80,
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
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = { diagnostics = { globals = { "vim" } } },
	},
	root_dir = root_with_fallback({ ".luarc.json", ".luarc.jsonc", ".git" }),
})

vim.lsp.config("ruff", {
	capabilities = capabilities,
	init_options = {
		settings = { lineLength = 88 },
	},
	root_dir = root_with_fallback({ "pyproject.toml", "setup.py", "setup.cfg", "ruff.toml", ".ruff.toml", ".git" }),
})

vim.lsp.config("ty", {
	capabilities = capabilities,
	settings = {
		ty = {
			completions = { autoImport = true },
			showSyntaxErrors = false,
		},
	},
	root_dir = root_with_fallback({ "pyproject.toml", "ty.toml", ".git" }),
})

vim.lsp.config("biome", {
	capabilities = capabilities,
	root_dir = root_with_fallback({ "biome.json", "biome.jsonc", "package.json", ".git" }),
})

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	settings = {
		typescript = { format = { enable = false } },
		javascript = { format = { enable = false } },
	},
	init_options = {
		preferences = {
			includeCompletionsForModuleExports = true,
		},
	},
	root_dir = root_with_fallback({ "tsconfig.json", "jsconfig.json", "package.json", ".git" }),
})

vim.lsp.enable({
	"lua_ls",
	"ruff",
	"ty",
	"biome",
	"ts_ls",
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
