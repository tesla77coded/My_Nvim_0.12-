-- ============================================================
-- Autocommands (Clean + Minimal)
-- ============================================================

local augroup = vim.api.nvim_create_augroup

-- ============================================================
-- Highlight on yank
-- ============================================================

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
	desc = "Highlight yanked text",
})
-- ============================================================
-- Restore cursor position
-- ============================================================

vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("RestoreCursor", { clear = true }),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)

		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	desc = "Restore cursor to last position",
})

-- ============================================================
-- Remove trailing whitespace on save
-- ============================================================

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("TrimWhitespace", { clear = true }),
	callback = function()
		local save = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(save)
	end,
	desc = "Trim trailing whitespace",
})

-- ============================================================
-- Auto create missing directories on save
-- ============================================================

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup("AutoCreateDir", { clear = true }),
	callback = function(event)
		local file = event.match
		local dir = vim.fn.fnamemodify(file, ":p:h")

		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
	desc = "Auto create dir on save",
})

-- ============================================================
-- Show diagnostics on hover
-- ============================================================

-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, {
-- 			focus = false,
-- 			border = "rounded",
-- 		})
-- 	end,
-- })

-- ============================================================
-- Fix nvim-tree colors to follow colorscheme
-- ============================================================

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.cmd([[
      hi! link NvimTreeNormal Normal
      hi! link NvimTreeNormalNC Normal
      hi! link NvimTreeEndOfBuffer EndOfBuffer
      hi! link NvimTreeVertSplit VertSplit
    ]])
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#5f875f" }) -- muted green
		vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#5f5f87" }) -- muted blue
		vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#875f5f" }) -- muted red
	end,
})
