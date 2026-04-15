-- ============================================================
-- Keymaps (Core Only - No Plugin Dependencies)
-- ============================================================

local map = vim.keymap.set

local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- ============================================================
-- General / Editing
-- ============================================================

-- Exit insert mode
map("i", "jk", "<Esc>", opts("Exit Insert"))

-- Save file
map("n", "<leader>s", "<cmd>w<cr>", opts("Save File"))

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<cr>", opts("Clear Search"))

-- Window navigation
map("n", "<leader>w", "<C-w>w", opts("Next Window"))

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", opts("Prev Buffer"))
map("n", "<S-l>", "<cmd>bnext<cr>", opts("Next Buffer"))
map("n", "<leader>bd", "<cmd>bdelete<cr>", opts("Delete Buffer"))

-- Explorer toggle
map("n", "<leader>e", function()
	local api = require("nvim-tree.api")

	if api.tree.is_visible() then
		api.tree.close()
	else
		api.tree.open({
			find_file = true,
			focus = true,
		})
	end
end, opts("Explorer toggle"))
-- ============================================================
-- Line movement
-- ============================================================

-- Normal mode
map("n", "<A-j>", "<cmd>move .+1<cr>==", opts("Move Line Down"))
map("n", "<A-k>", "<cmd>move .-2<cr>==", opts("Move Line Up"))

-- Insert mode
map("i", "<A-j>", "<Esc><cmd>move .+1<cr>==gi", opts("Move Line Down"))
map("i", "<A-k>", "<Esc><cmd>move .-2<cr>==gi", opts("Move Line Up"))

-- Visual mode
map("v", "<A-j>", ":move '>+1<cr>gv=gv", opts("Move Lines Down"))
map("v", "<A-k>", ":move '<-2<cr>gv=gv", opts("Move Lines Up"))

-- ============================================================
-- Editing enhancements
-- ============================================================

-- Yank line without newline
map("n", "yy", "^y$", opts("Yank without newline"))

-- Select full line
map("n", "vv", "V", opts("Select Line"))

-- Increment / Decrement
map("n", "=", "<C-a>", opts("Increment"))
map("n", "-", "<C-x>", opts("Decrement"))

-- ============================================================
-- Diagnostics (Native - no plugins)
-- ============================================================

map("n", "[d", function()
	vim.diagnostic.jump({ count = -1 })
end, opts("Prev Diagnostic"))

map("n", "]d", function()
	vim.diagnostic.jump({ count = 1 })
end, opts("Next Diagnostic"))

map("n", "<leader>d", vim.diagnostic.open_float, opts("Line Diagnostics"))
map("n", "<leader>da", vim.diagnostic.setloclist, opts("Diagnostics List"))

-- ============================================================
-- Telescope
-- ============================================================

map("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, opts("Find Files"))

map("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, opts("Live Grep"))

map("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, opts("Buffers"))

map("n", "<leader>fr", function()
	require("telescope.builtin").oldfiles()
end, opts("Recent Files"))
