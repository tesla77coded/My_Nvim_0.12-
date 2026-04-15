-- colors/gruber-darker-clean.lua
-- Gruber-Darker inspired high-clarity dark theme (faithful palette mapping)
-- Based on blazkowolf/gruber-darker.nvim palette + highlight philosophy

local colors = {
	-- Backgrounds (deep neutral dark)
	bg = "#181818", -- main bg
	bg1 = "#282828", -- cursorline / subtle tier
	bg2 = "#453d41", -- pmenu / visual / folded
	bg3 = "#484848", -- borders
	bg4 = "#52494e", -- line numbers, subtle UI

	-- Foregrounds (clean neutral with slight warmth)
	fg = "#e4e4e4", -- main text
	fg1 = "#f4f4ff", -- brighter
	fg2 = "#f5f5f5", -- dimmer / secondary

	-- Core Gruber accents
	red = "#f43841", -- errors, warnings
	red1 = "#c73c3f", -- darker red
	green = "#73d936", -- strings
	yellow = "#ffdd33", -- keywords, functions, statements
	brown = "#cc8c3c", -- comments, folds
	quartz = "#95a99f", -- types, constants, preproc
	niagara = "#96a6c8", -- functions, directories, info
	wisteria = "#9e95c7", -- numbers, booleans, special

	-- Supporting
	white = "#ffffff",
	black = "#000000",
	-- Derived UI
	comment = "#cc8c3c", -- brown
}

-- Derived
local bg_dark = colors.bg
local bg_light = colors.bg1
local fg_dim = colors.brown

-- Helper
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Reset
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "gruber-darker-clean"

-- ========================
-- Editor
-- ========================
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalNC", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.bg1 })
hl("Cursor", { fg = colors.black, bg = colors.yellow })
hl("lCursor", { fg = colors.black, bg = colors.yellow })
hl("CursorLine", { bg = colors.bg1 })
hl("CursorColumn", { bg = colors.bg1 })
hl("ColorColumn", { bg = colors.bg2 })

-- ========================
-- Line numbers & columns
-- ========================
hl("LineNr", { fg = colors.bg4 })
hl("CursorLineNr", { fg = colors.yellow, bold = true })
hl("SignColumn", { fg = colors.bg4, bg = colors.bg })
hl("FoldColumn", { fg = colors.brown, bg = colors.bg })
hl("Folded", { fg = colors.brown, bg = colors.bg2, italic = true })

-- ========================
-- Search & selection
-- ========================
hl("Search", { fg = colors.niagara, bg = colors.fg1 }) -- or adjust for contrast
hl("IncSearch", { fg = colors.black, bg = colors.fg2 })
hl("CurSearch", { fg = colors.black, bg = colors.yellow })
hl("Visual", { bg = colors.bg2 })
hl("VisualNOS", { bg = colors.bg2 })

-- ========================
-- Messages
-- ========================
hl("ErrorMsg", { fg = colors.red, bold = true })
hl("WarningMsg", { fg = colors.red })
hl("MoreMsg", { fg = colors.niagara })
hl("Question", { fg = colors.niagara })
hl("ModeMsg", { fg = colors.yellow, bold = true })

-- ========================
-- Statusline & tabs
-- ========================
hl("StatusLine", { fg = colors.white, bg = colors.bg1, bold = true })
hl("StatusLineNC", { fg = colors.quartz, bg = colors.bg1 })
hl("TabLine", { fg = colors.fg2, bg = colors.bg })
hl("TabLineSel", { fg = colors.yellow, bg = colors.bg, bold = true })
hl("TabLineFill", { bg = "None" })

-- ========================
-- Popups & menus
-- ========================
hl("Pmenu", { fg = colors.fg, bg = colors.bg1 })
hl("PmenuSel", { fg = colors.fg, bg = colors.bg2 })
hl("PmenuSbar", { bg = colors.bg })
hl("PmenuThumb", { bg = colors.bg3 })

-- ========================
-- Splits
-- ========================
hl("VertSplit", { fg = colors.bg3 })
hl("WinSeparator", { fg = colors.bg3 })

-- ========================
-- Diff
-- ========================
hl("DiffAdd", { fg = colors.green, bg = colors.bg1 })
hl("DiffChange", { fg = colors.yellow, bg = colors.bg1 })
hl("DiffDelete", { fg = colors.red, bg = colors.bg1 })
hl("DiffText", { fg = colors.yellow, bg = colors.bg2, bold = true })

-- ========================
-- Syntax (classic Gruber style)
-- ========================
hl("Comment", { fg = colors.brown, italic = true })
hl("Identifier", { fg = colors.fg })
hl("Function", { fg = colors.niagara, bold = true })
hl("Type", { fg = colors.quartz })
hl("Statement", { fg = colors.yellow })
hl("Keyword", { fg = colors.yellow, bold = true })
hl("Operator", { fg = colors.fg })
hl("Conditional", { fg = colors.yellow, bold = true })
hl("Repeat", { fg = colors.yellow, bold = true })
hl("String", { fg = colors.green, italic = true })
hl("Character", { fg = colors.green })
hl("Number", { fg = colors.wisteria })
hl("Boolean", { fg = colors.yellow, bold = true })
hl("Float", { fg = colors.wisteria })
hl("Constant", { fg = colors.quartz })
hl("Special", { fg = colors.yellow })
hl("SpecialComment", { fg = colors.wisteria })
hl("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
hl("Error", { fg = colors.red, bold = true })

-- ========================
-- Treesitter essentials
-- ========================
hl("@comment", { fg = colors.brown, italic = true })
hl("@function", { fg = colors.niagara, bold = true })
hl("@keyword", { fg = colors.yellow, bold = true })
hl("@keyword.return", { fg = colors.niagara, bold = true })
hl("@string", { fg = colors.green, italic = true })
hl("@type", { fg = colors.quartz })
hl("@constant", { fg = colors.quartz })
hl("@number", { fg = colors.wisteria })
hl("@operator", { fg = colors.fg })

-- ========================
-- Diagnostics
-- ========================
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.red })
hl("DiagnosticInfo", { fg = colors.niagara })
hl("DiagnosticHint", { fg = colors.quartz })

-- Optional: add more groups (LSP, cmp, telescope, etc.) as needed
