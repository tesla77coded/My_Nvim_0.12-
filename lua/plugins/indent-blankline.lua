local hooks = require("ibl.hooks")

-- Register highlight setup hook to reset colors on colorscheme change
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "IblScope", { fg = "#8b8681" })
end)

require("ibl").setup({
	indent = {
		char = "│",
		tab_char = "│",
	},
	scope = {
		enabled = true,
		show_start = false,
		show_end = false,
		highlight = { "IblScope" }, -- ← must be a table
		-- include = { node_type = { ["*"] = { "*" } } }  -- you can remove this line;
		-- the default already includes everything you need
	},
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
			"mason",
		},
	},
})

-- ONLY keep the line below if you are using rainbow-delimiters.nvim
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
