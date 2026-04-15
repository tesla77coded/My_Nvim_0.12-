-- ~/.config/nvim/colors/default-soft.lua

-- clear existing highlights
vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "default-soft"

-- load base theme
vim.cmd("colorscheme default")

-- -----------------------------
-- utility: soften color
-- -----------------------------
local function soften(hex, factor)
	hex = hex:gsub("#", "")
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)

	r = math.floor(r + (255 - r) * factor)
	g = math.floor(g + (255 - g) * factor)
	b = math.floor(b + (255 - b) * factor)

	return string.format("#%02x%02x%02x", r, g, b)
end

local function soften_group(name, factor)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name })
	if not ok or not hl or not hl.fg then
		return
	end

	vim.api.nvim_set_hl(0, name, {
		fg = soften(string.format("#%06x", hl.fg), factor),
		bg = hl.bg and string.format("#%06x", hl.bg) or nil,
		bold = hl.bold,
		italic = hl.italic,
	})
end

-- -----------------------------
-- groups to tweak
-- -----------------------------
local groups = {
	"Normal",

	"Comment",

	"String",
	"@string",

	"Identifier",
	"Function",
	"@function",

	"Statement",
	"Keyword",
	"@keyword",

	"Type",
	"@type",

	"Constant",
}

for _, group in ipairs(groups) do
	soften_group(group, 0.2)
end
