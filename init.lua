-- ============================================================
-- Neovim 0.12+ Optimized Init (Native vim.pack)
-- ============================================================

-- Leader keys MUST come first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================
-- Core settings
-- ============================================================
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.neovide")

-- ============================================================
-- vim.pack Configuration
-- ============================================================

-- Ensure packpath
vim.opt.packpath:prepend(vim.fn.stdpath("data") .. "/site")

-- Disable netrw (required for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- Add plugins using FULL GitHub URLs (correct format for vim.pack)
vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/echasnovski/mini.pairs" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/echasnovski/mini.ai" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- { src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/tpope/vim-sleuth" },
	{ src = "https://github.com/rktjmp/lush.nvim.git" },
	{ src = "https://github.com/ray-x/lsp_signature.nvim.git" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim.git" },
	{ src = "https://github.com/folke/todo-comments.nvim.git" },
	{ src = "https://github.com/nvimdev/dashboard-nvim.git" },
})
-- Add new plugins here

-- ============================================================
-- Early Plugin Setups (Critical Order)
-- ============================================================

-- nvim-tree setup (must be early)
require("nvim-tree").setup({
	view = {
		width = 30,
		side = "right",
	},
	renderer = {
		highlight_git = true, -- use git highlight groups
		highlight_diagnostics = true,
		highlight_opened_files = "name", -- or "icon" / "name" / "all" if you want
		highlight_modified = "none",

		icons = {
			show = {
				file = true,
				folder = true,
				git = true,
			},
		},
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
	filters = {
		dotfiles = false,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true }
		end

		api.config.mappings.default_on_attach(bufnr)

		vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
		vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
	end,
})

-- ============================================================
-- Load remaining plugins & configs
-- ============================================================
vim.cmd("packloadall")

-- Modular plugin configurations (remove nvimtree from here)
pcall(require, "plugins")

-- ============================================================
-- Colorscheme
-- ============================================================
vim.opt.background = "light"
pcall(vim.cmd.colorscheme, "custom") -- Change to your preferred colorscheme

-- -- === NVIM-TREE HIGHLIGHTS - Respect your custom colorscheme ===
-- local colors = {
-- 	-- Your existing colors table here
-- 	bg = "#1c1e26",
-- 	bg1 = "#232530",
-- 	bg2 = "#2e303e",
-- 	bg3 = "#3e4057",
-- 	bg4 = "#4e5166",
--
-- 	fg = "#d4cfc9",
-- 	fg1 = "#e8e3dd",
-- 	fg2 = "#b8b3ad",
--
-- 	yellow_muted = "#d4a574",
-- 	green_muted = "#7eb895",
--
-- 	white = "#ffffff",
-- 	black = "#0f1117",
-- 	brown = "#c98a6a",
-- 	quartz = "#6ba4b8",
-- 	niagara = "#7fa7d4",
-- 	wisteria = "#a68fd1",
-- 	red = "#d67676",
--
-- 	comment = "#6b8a7a",
-- 	special_return = "#7fa7d4",
-- 	-- ... add any other colors you use
-- }

-- local function setup_nvimtree_highlights()
-- 	local hl = vim.api.nvim_set_hl
--
-- 	-- Main window
-- 	hl(0, "NvimTreeNormal", { bg = colors.bg, fg = colors.fg })
-- 	hl(0, "NvimTreeNormalNC", { bg = colors.bg, fg = colors.fg2 })
-- 	hl(0, "NvimTreeEndOfBuffer", { bg = colors.bg, fg = colors.bg })
--
-- 	-- Folders and files
-- 	hl(0, "NvimTreeFolderName", { fg = colors.niagara, bold = true })
-- 	hl(0, "NvimTreeOpenedFolderName", { fg = colors.niagara, bold = true })
-- 	hl(0, "NvimTreeFolderIcon", { fg = colors.quartz })
-- 	hl(0, "NvimTreeFileIcon", { fg = colors.fg2 })
--
-- 	hl(0, "NvimTreeRootFolder", { fg = colors.wisteria, bold = true })
-- 	hl(0, "NvimTreeSymlink", { fg = colors.niagara, underline = true })
--
-- 	-- Git status
-- 	hl(0, "NvimTreeGitDirty", { fg = colors.yellow_muted })
-- 	hl(0, "NvimTreeGitStaged", { fg = colors.green_muted })
-- 	hl(0, "NvimTreeGitNew", { fg = colors.green_muted })
-- 	hl(0, "NvimTreeGitDeleted", { fg = colors.red })
-- 	hl(0, "NvimTreeGitIgnored", { fg = colors.comment })
-- 	hl(0, "NvimTreeGitMerge", { fg = colors.brown })
--
-- 	-- Cursor / selection
-- 	hl(0, "NvimTreeCursorLine", { bg = colors.bg2 })
-- 	hl(0, "NvimTreeIndentMarker", { fg = colors.bg4 })
--
-- 	-- Opened / modified files
-- 	hl(0, "NvimTreeOpenedFile", { fg = colors.fg1, bold = true })
-- 	hl(0, "NvimTreeModified", { fg = colors.yellow_muted })
--
-- 	-- Special files
-- 	hl(0, "NvimTreeExecFile", { fg = colors.green_muted, bold = true })
-- 	hl(0, "NvimTreeSpecialFile", { fg = colors.wisteria })
-- end
--
-- -- Apply highlights immediately
-- setup_nvimtree_highlights()
--
-- -- Re-apply every time colorscheme changes (very important!)
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	group = vim.api.nvim_create_augroup("NvimTreeHighlights", { clear = true }),
-- 	callback = setup_nvimtree_highlights,
-- })

-- ============================================================
-- Utility Commands
-- ============================================================
-- Update all plugins
vim.keymap.set("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "Update all plugins (vim.pack)", silent = true })
