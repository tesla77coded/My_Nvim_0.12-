-- ============================================================
-- Neovide Configuration
-- ============================================================

if not vim.g.neovide then
	return
end

-- Font
vim.o.guifont = "Iosevka Nerd Font:h17"

-- Spacing
vim.o.linespace = 1

-- Title
vim.o.title = true
vim.o.titlestring = "Neovide"

-- Cursor
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_animation_length = 0.1 -- normal-mode jumps: quick, visible glide
vim.g.neovide_cursor_short_animation_length = 0.07 -- typing: short, smooth glide (VSCode-like, not instant)
vim.g.neovide_cursor_trail_size = 0.35 -- lower = smoother glide with a soft trail (1.0 = no smoothing)
vim.g.neovide_cursor_short_animation_length = 0.15
vim.g.neovide_cursor_animate_in_insert_mode = true -- keep animation on while typing
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_vfx_mode = "" -- keep particles off — VSCode has none, keeps motion clean

-- Scroll animation
vim.g.neovide_scroll_animation_length = 0.5
vim.g.neovide_scroll_animation_far_lines = 1

-- Transparency (optional)
-- vim.g.neovide_transparency = 0.9

-- Scale (zoom)
vim.g.neovide_scale_factor = 1.0

local function change_scale(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set("n", "<C-=>", function()
	change_scale(1.25)
end)

vim.keymap.set("n", "<C-->", function()
	change_scale(1 / 1.25)
end)

vim.keymap.set("n", "<C-0>", function()
	vim.g.neovide_scale_factor = 1.0
end)

-- Insert mode QoL
vim.keymap.set("i", "<C-BS>", "<C-w>", { silent = true })
vim.keymap.set("i", "<C-V>", "<C-R>+", { silent = true })
