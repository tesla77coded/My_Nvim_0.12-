-- ============================================================
-- Telescope
-- ============================================================

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup({
  defaults = {
    layout_config = {
      horizontal = { preview_width = 0.6 },
    },
    file_ignore_patterns = { "node_modules", ".git/" },
  },
})
