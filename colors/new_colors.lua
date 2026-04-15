-- Serene: A minimal, soothing colorscheme for Neovim 0.12
-- Soft pastel colors with variants of white, red, green, and blue
-- Inspired by gruber-darker's minimalism but with softer, eye-friendly tones

-- Color palette - soft pastel variants
local colors = {
  -- Background and foreground
  bg = "#1a1d23",           -- Dark muted background
  bg_light = "#252932",     -- Slightly lighter background
  bg_lighter = "#2d3139",   -- Lighter background for selections
  fg = "#d8dee9",           -- Soft white-ish foreground
  fg_dim = "#9ca3b0",       -- Dimmed foreground
  fg_darker = "#6b7280",    -- Darker dim for comments

  -- Core colors - soft pastels
  red = "#e89393",          -- Soft pastel red
  red_dim = "#c97777",      -- Dimmed red

  green = "#a8d4a9",        -- Soft pastel green
  green_dim = "#8fb890",    -- Dimmed green

  blue = "#a5c6e1",         -- Soft pastel blue
  blue_dim = "#88abc9",     -- Dimmed blue
  blue_darker = "#6b8faa",  -- Darker blue

  -- UI elements
  visual = "#3d4654",       -- Visual selection
  cursor_line = "#222630",  -- Current line
  line_nr = "#4a5261",      -- Line numbers
  border = "#3d4654",       -- Window borders

  -- Diagnostic/Git colors (subtle variants)
  error = "#d88383",        -- Soft error red
  warning = "#e8b59d",      -- Soft warning (red-orange)
  info = "#9dc4df",         -- Soft info blue
  hint = "#b0d4b1",         -- Soft hint green
}

-- Helper function to set highlight groups
local function hi(group, opts)
  local cmd = "highlight " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.style then cmd = cmd .. " gui=" .. opts.style end
  if opts.sp then cmd = cmd .. " guisp=" .. opts.sp end
  vim.cmd(cmd)
end

  -- Reset existing highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "new-colors"
-- Editor UI
  hi("Normal", { fg = colors.fg, bg = colors.bg })
  hi("NormalFloat", { fg = colors.fg, bg = colors.bg_light })
  hi("FloatBorder", { fg = colors.border, bg = colors.bg_light })
  hi("CursorLine", { bg = colors.cursor_line })
  hi("CursorLineNr", { fg = colors.blue, bg = colors.cursor_line })
  hi("LineNr", { fg = colors.line_nr })
  hi("SignColumn", { bg = colors.bg })
  hi("VertSplit", { fg = colors.border })
  hi("Visual", { bg = colors.visual })
  hi("VisualNOS", { bg = colors.visual })
  hi("Search", { fg = colors.bg, bg = colors.blue })
  hi("IncSearch", { fg = colors.bg, bg = colors.green })
  hi("CursorColumn", { bg = colors.cursor_line })
  hi("ColorColumn", { bg = colors.bg_light })
  hi("Folded", { fg = colors.fg_dim, bg = colors.bg_light })
  hi("FoldColumn", { fg = colors.fg_darker, bg = colors.bg })
  hi("MatchParen", { fg = colors.blue, style = "bold" })
  hi("Pmenu", { fg = colors.fg, bg = colors.bg_light })
  hi("PmenuSel", { fg = colors.bg, bg = colors.blue })
  hi("PmenuSbar", { bg = colors.bg_lighter })
  hi("PmenuThumb", { bg = colors.blue_dim })

  -- Statusline
  hi("StatusLine", { fg = colors.fg, bg = colors.bg_light })
  hi("StatusLineNC", { fg = colors.fg_darker, bg = colors.bg_light })
  hi("TabLine", { fg = colors.fg_dim, bg = colors.bg_light })
  hi("TabLineFill", { bg = colors.bg_light })
  hi("TabLineSel", { fg = colors.fg, bg = colors.bg_lighter })

  -- Syntax groups (standard)
  hi("Comment", { fg = colors.fg_darker, style = "italic" })
  hi("Constant", { fg = colors.green })
  hi("String", { fg = colors.green })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.green_dim })
  hi("Boolean", { fg = colors.green_dim })
  hi("Float", { fg = colors.green_dim })

  hi("Identifier", { fg = colors.fg })
  hi("Function", { fg = colors.blue })

  hi("Statement", { fg = colors.red })
  hi("Conditional", { fg = colors.red })
  hi("Repeat", { fg = colors.red })
  hi("Label", { fg = colors.red_dim })
  hi("Operator", { fg = colors.fg })
  hi("Keyword", { fg = colors.red })
  hi("Exception", { fg = colors.red_dim })

  hi("PreProc", { fg = colors.blue_dim })
  hi("Include", { fg = colors.red })
  hi("Define", { fg = colors.red })
  hi("Macro", { fg = colors.blue_dim })
  hi("PreCondit", { fg = colors.red_dim })

  hi("Type", { fg = colors.blue })
  hi("StorageClass", { fg = colors.red })
  hi("Structure", { fg = colors.blue })
  hi("Typedef", { fg = colors.blue })

  hi("Special", { fg = colors.blue_dim })
  hi("SpecialChar", { fg = colors.green })
  hi("Tag", { fg = colors.blue })
  hi("Delimiter", { fg = colors.fg_dim })
  hi("SpecialComment", { fg = colors.fg_darker, style = "italic" })
  hi("Debug", { fg = colors.red })

  hi("Underlined", { style = "underline" })
  hi("Ignore", { fg = colors.fg_darker })
  hi("Error", { fg = colors.error })
  hi("Todo", { fg = colors.bg, bg = colors.blue, style = "bold" })

  -- Treesitter syntax groups
  hi("@variable", { fg = colors.fg })
  hi("@variable.builtin", { fg = colors.red_dim })
  hi("@variable.parameter", { fg = colors.fg })
  hi("@variable.member", { fg = colors.fg })

  hi("@constant", { fg = colors.green })
  hi("@constant.builtin", { fg = colors.green_dim })
  hi("@constant.macro", { fg = colors.blue_dim })

  hi("@string", { fg = colors.green })
  hi("@string.escape", { fg = colors.green_dim })
  hi("@string.special", { fg = colors.green_dim })
  hi("@character", { fg = colors.green })
  hi("@number", { fg = colors.green_dim })
  hi("@boolean", { fg = colors.green_dim })
  hi("@float", { fg = colors.green_dim })

  hi("@function", { fg = colors.blue })
  hi("@function.builtin", { fg = colors.blue })
  hi("@function.macro", { fg = colors.blue_dim })
  hi("@function.call", { fg = colors.blue })
  hi("@method", { fg = colors.blue })
  hi("@method.call", { fg = colors.blue })
  hi("@constructor", { fg = colors.blue })

  hi("@keyword", { fg = colors.red })
  hi("@keyword.function", { fg = colors.red })
  hi("@keyword.operator", { fg = colors.red })
  hi("@keyword.return", { fg = colors.red })
  hi("@keyword.conditional", { fg = colors.red })
  hi("@keyword.repeat", { fg = colors.red })
  hi("@keyword.import", { fg = colors.red })
  hi("@keyword.exception", { fg = colors.red_dim })

  hi("@operator", { fg = colors.fg })
  hi("@punctuation.bracket", { fg = colors.fg_dim })
  hi("@punctuation.delimiter", { fg = colors.fg_dim })
  hi("@punctuation.special", { fg = colors.blue_dim })

  hi("@type", { fg = colors.blue })
  hi("@type.builtin", { fg = colors.blue })
  hi("@type.definition", { fg = colors.blue })

  hi("@attribute", { fg = colors.blue_dim })
  hi("@property", { fg = colors.fg })
  hi("@field", { fg = colors.fg })

  hi("@comment", { fg = colors.fg_darker, style = "italic" })
  hi("@comment.error", { fg = colors.error })
  hi("@comment.warning", { fg = colors.warning })
  hi("@comment.todo", { fg = colors.blue, style = "bold" })
  hi("@comment.note", { fg = colors.info })

  hi("@tag", { fg = colors.blue })
  hi("@tag.attribute", { fg = colors.fg })
  hi("@tag.delimiter", { fg = colors.fg_dim })

  -- LSP semantic tokens
  hi("@lsp.type.class", { fg = colors.blue })
  hi("@lsp.type.decorator", { fg = colors.blue_dim })
  hi("@lsp.type.enum", { fg = colors.blue })
  hi("@lsp.type.enumMember", { fg = colors.green })
  hi("@lsp.type.function", { fg = colors.blue })
  hi("@lsp.type.interface", { fg = colors.blue })
  hi("@lsp.type.macro", { fg = colors.blue_dim })
  hi("@lsp.type.method", { fg = colors.blue })
  hi("@lsp.type.namespace", { fg = colors.blue })
  hi("@lsp.type.parameter", { fg = colors.fg })
  hi("@lsp.type.property", { fg = colors.fg })
  hi("@lsp.type.struct", { fg = colors.blue })
  hi("@lsp.type.type", { fg = colors.blue })
  hi("@lsp.type.typeParameter", { fg = colors.blue })
  hi("@lsp.type.variable", { fg = colors.fg })

  -- LSP diagnostics
  hi("DiagnosticError", { fg = colors.error })
  hi("DiagnosticWarn", { fg = colors.warning })
  hi("DiagnosticInfo", { fg = colors.info })
  hi("DiagnosticHint", { fg = colors.hint })

  hi("DiagnosticUnderlineError", { sp = colors.error, style = "undercurl" })
  hi("DiagnosticUnderlineWarn", { sp = colors.warning, style = "undercurl" })
  hi("DiagnosticUnderlineInfo", { sp = colors.info, style = "undercurl" })
  hi("DiagnosticUnderlineHint", { sp = colors.hint, style = "undercurl" })

  hi("DiagnosticVirtualTextError", { fg = colors.error })
  hi("DiagnosticVirtualTextWarn", { fg = colors.warning })
  hi("DiagnosticVirtualTextInfo", { fg = colors.info })
  hi("DiagnosticVirtualTextHint", { fg = colors.hint })

  hi("DiagnosticSignError", { fg = colors.error })
  hi("DiagnosticSignWarn", { fg = colors.warning })
  hi("DiagnosticSignInfo", { fg = colors.info })
  hi("DiagnosticSignHint", { fg = colors.hint })

  -- Git signs
  hi("GitSignsAdd", { fg = colors.green })
  hi("GitSignsChange", { fg = colors.blue })
  hi("GitSignsDelete", { fg = colors.red })

  hi("DiffAdd", { fg = colors.green, bg = colors.bg_light })
  hi("DiffChange", { fg = colors.blue, bg = colors.bg_light })
  hi("DiffDelete", { fg = colors.red, bg = colors.bg_light })
  hi("DiffText", { fg = colors.fg, bg = colors.bg_lighter })

  -- Telescope (popular fuzzy finder)
  hi("TelescopeBorder", { fg = colors.border })
  hi("TelescopeSelection", { fg = colors.fg, bg = colors.visual })
  hi("TelescopeMatching", { fg = colors.blue, style = "bold" })

  -- NvimTree (file explorer)
  hi("NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
  hi("NvimTreeFolderName", { fg = colors.blue })
  hi("NvimTreeFolderIcon", { fg = colors.blue })
  hi("NvimTreeOpenedFolderName", { fg = colors.blue, style = "bold" })
  hi("NvimTreeRootFolder", { fg = colors.red, style = "bold" })
  hi("NvimTreeSpecialFile", { fg = colors.green })
  hi("NvimTreeGitDirty", { fg = colors.red })
  hi("NvimTreeGitNew", { fg = colors.green })
  hi("NvimTreeGitDeleted", { fg = colors.red_dim })

  -- Markdown
  hi("markdownH1", { fg = colors.red, style = "bold" })
  hi("markdownH2", { fg = colors.red, style = "bold" })
  hi("markdownH3", { fg = colors.blue, style = "bold" })
  hi("markdownH4", { fg = colors.blue })
  hi("markdownH5", { fg = colors.blue })
  hi("markdownH6", { fg = colors.blue })
  hi("markdownHeadingDelimiter", { fg = colors.red_dim })
  hi("markdownCode", { fg = colors.green })
  hi("markdownCodeBlock", { fg = colors.green })
  hi("markdownCodeDelimiter", { fg = colors.green_dim })
  hi("markdownUrl", { fg = colors.blue, style = "underline" })
  hi("markdownLink", { fg = colors.blue })
  hi("markdownLinkText", { fg = colors.fg })
  hi("markdownLinkDelimiter", { fg = colors.fg_dim })

  -- WhichKey (keybinding helper)
  hi("WhichKey", { fg = colors.blue })
  hi("WhichKeyGroup", { fg = colors.red })
  hi("WhichKeyDesc", { fg = colors.fg })
  hi("WhichKeySeparator", { fg = colors.fg_darker })

  -- Completion menu (nvim-cmp)
  hi("CmpItemAbbrMatch", { fg = colors.blue, style = "bold" })
  hi("CmpItemAbbrMatchFuzzy", { fg = colors.blue_dim })
  hi("CmpItemKindFunction", { fg = colors.blue })
  hi("CmpItemKindMethod", { fg = colors.blue })
  hi("CmpItemKindVariable", { fg = colors.fg })
  hi("CmpItemKindKeyword", { fg = colors.red })
  hi("CmpItemKindClass", { fg = colors.blue })
  hi("CmpItemKindInterface", { fg = colors.blue })
  hi("CmpItemKindText", { fg = colors.fg })

  -- Terminal colors
  -- vim.g.terminal_color_0 = colors.bg
  -- vim.g.terminal_color_1 = colors.red
  -- vim.g.terminal_color_2 = colors.green
  -- vim.g.terminal_color_3 = colors.warning
  -- vim.g.terminal_color_4 = colors.blue
  -- vim.g.terminal_color_5 = colors.red_dim
  -- vim.g.terminal_color_6 = colors.blue_dim
  -- vim.g.terminal_color_7 = colors.fg
  -- vim.g.terminal_color_8 = colors.fg_darker
  -- vim.g.terminal_color_9 = colors.red
  -- vim.g.terminal_color_10 = colors.green
  -- vim.g.terminal_color_11 = colors.warning
  -- vim.g.terminal_color_12 = colors.blue
  -- vim.g.terminal_color_13 = colors.red_dim
  -- vim.g.terminal_color_14 = colors.blue_dim
  -- vim.g.terminal_color_15 = colors.fg

