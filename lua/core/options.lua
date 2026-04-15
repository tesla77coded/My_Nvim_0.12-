-- ============================================================
-- Core Options (Neovim 0.12 Safe)
-- ============================================================

local opt = vim.opt

-- ============================================================
-- UI
-- ============================================================
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.winborder = "rounded"

opt.termguicolors = true
opt.signcolumn = "yes"

opt.cmdheight = 0

opt.scrolloff = 4
opt.wrap = false

opt.splitbelow = true
opt.splitright = true

require("vim._core.ui2").enable({
	enable = true,
	msg = {
		targets = "cmd",
	},
})

-- ============================================================
-- Cursor (block everywhere, color changes per mode)
-- ============================================================

vim.opt.guicursor = table.concat({
	"n-v-c:block-Cursor", -- Normal, Visual, Command
	"i-ci:block-CursorInsert", -- Insert
	"r-cr:block-CursorReplace", -- Replace
}, ",")

-- ============================================================
-- Indentation
-- ============================================================
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true

-- ============================================================
-- Search
-- ============================================================
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- ============================================================
-- Files & Backup
-- ============================================================
opt.swapfile = false
opt.undofile = true

local undodir = vim.fn.stdpath("state") .. "/undo"
opt.undodir = undodir

-- ============================================================
-- Performance / Behavior
-- ============================================================
opt.updatetime = 300

-- IMPORTANT: let Neovim handle completion properly
opt.autocomplete = false

-- ============================================================
-- Clipboard (Linux - wl-clipboard)
-- ============================================================
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = {
		["+"] = "wl-copy",
		["*"] = "wl-copy",
	},
	paste = {
		["+"] = "wl-paste --no-newline",
		["*"] = "wl-paste --no-newline",
	},
	cache_enabled = 0,
}

opt.clipboard = "unnamedplus"

-- ============================================================
-- Mouse
-- ============================================================
opt.mouse = "a"

-- ============================================================
-- Misc
-- ============================================================
opt.iskeyword:remove("_")
opt.colorcolumn = "100"
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌵 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,
	virtual_text = false,
	severity_sort = true,
	float = { border = "rounded" },
})

-- ============================================================
-- Tabline (buffers at top)
-- ============================================================

vim.opt.showtabline = 2
vim.opt.tabline = "%!v:lua.MyTabline()"

function _G.MyTabline()
	local s = ""

	for i = 1, vim.fn.bufnr("$") do
		if vim.fn.buflisted(i) == 1 then
			local name = vim.fn.bufname(i)
			local filename = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"

			if i == vim.fn.bufnr("%") then
				s = s .. "%#TabLineSel#"
			else
				s = s .. "%#TabLine#"
			end

			s = s .. " " .. filename .. " "
		end
	end

	return s .. "%#TabLineFill#"
end

-- ============================================================
-- Diagnostic Signs (icons instead of letters)
-- ============================================================

local signs = {
	Error = " ",
	Warn = " ",
	Hint = "󰌵 ",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
