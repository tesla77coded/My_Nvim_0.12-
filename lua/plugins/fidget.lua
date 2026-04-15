require("fidget").setup({
	notification = {
		override_vim_notify = false, -- Let nvim-notify handle vim.notify
		window = {
			avoid = { "NvimTree" },
		},
	},
	-- LSP progress UI
	progress = {
		display = {
			progress_icon = "dots",
		},
	},
	-- Remove the deprecated integration section entirely
})
