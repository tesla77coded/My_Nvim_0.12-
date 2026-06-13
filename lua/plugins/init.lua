-- ============================================================
-- Plugin Config Loader (Optimized Order)
-- ============================================================

-- 1. Foundational / UI dependencies
require("plugins.devicons")
require("plugins.dashboard")

-- 2. Syntax & Text objects ()
require("plugins.treesitter")
require("plugins.mini")

-- 3. Core editing & UI plugins
require("plugins.notify")
require("plugins.gitsigns")

-- 4. Fuzzy finder
require("plugins.telescope")
require("plugins.todo-comments")

-- 5. LSP + Completion + Formatting ()
require("plugins.lsp")
require("plugins.completion")
require("plugins.conform")
require("plugins.indent-blankline")

-- 6. Which-key ()
require("plugins.which-key")

-- 7. Statusline / Optional UI ()
require("plugins.lualine")

-- 8. File explorer (moved to init.lua)
-- require("plugins.nvimtree")

-- 9. LSP-related extras
require("plugins.lsp-signature")

-- 10. Colorschemes (only one will actually set the colorscheme)
-- require("plugins.zenbones")
