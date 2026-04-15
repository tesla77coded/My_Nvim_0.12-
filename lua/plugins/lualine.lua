-- ============================================================
-- Lualine (Your style + auto-hide, cleaned)
-- ============================================================

local lualine = require("lualine")

-- empty component
local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
	self.status = ""
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

-- clock
local function clock()
	local t = os.date("*t")
	local hour = t.hour % 12
	if hour == 0 then
		hour = 12
	end
	return string.format("%02d:%02d %s", hour, t.min, t.hour < 12 and "AM" or "PM")
end

lualine.setup({
	options = {
		theme = "auto",
		globalstatus = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "╲", right = "╱" },
	},

	sections = {
		lualine_a = {
			{ "mode", separator = { right = "" } },
			{ empty, separator = { right = "" } },
		},

		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = {
					error = "󰀩 ",
					warn = " ",
					hint = " ",
					info = " ",
				},
			},
		},

		lualine_c = {},

		lualine_x = {
			{ "filetype", icon_only = true },
		},

		lualine_y = {},

		lualine_z = {
			{ empty, separator = { left = "" } },
			{ clock },
		},
	},
})

-- 🔥 Auto-hide logic (restored cleanly)
vim.o.laststatus = 0

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		vim.o.laststatus = 3
		vim.defer_fn(function()
			vim.o.laststatus = 0
		end, 3000)
	end,
})
