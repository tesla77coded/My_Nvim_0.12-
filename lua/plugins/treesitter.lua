local supported = {
	python = true,
	lua = true,
	javascript = true,
	typescript = true,
	tsx = true,
	json = true,
	html = true,
	css = true,
	bash = true,
}

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if supported[ft] then
			vim.treesitter.start(args.buf, ft)
		end
	end,
})
vim.api.nvim_set_hl(0, "IblScope", { fg = "#E06C75" }) -- Red color (adjust to your preference)
