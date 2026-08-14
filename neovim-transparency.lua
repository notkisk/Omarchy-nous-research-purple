-- Nous Research Purple keeps the original Aether palette opaque in Neovim.
-- This file is installed as plugin/after/transparency.lua because Omarchy's
-- theme hot-reloader sources that path after every colorscheme change.
local backgrounds = {
  Normal = "#1e1e2e",
  NormalNC = "#1e1e2e",
  EndOfBuffer = "#1e1e2e",
  FoldColumn = "#1e1e2e",
  SignColumn = "#1e1e2e",
  LineNr = "#1e1e2e",
  Terminal = "#1e1e2e",
  NormalFloat = "#171723",
  FloatBorder = "#171723",
  Pmenu = "#171723",
  PmenuSbar = "#353543",
  PmenuThumb = "#89b4fa",
  Folded = "#171723",
  WhichKeyFloat = "#171723",
  TelescopeBorder = "#171723",
  TelescopeNormal = "#171723",
  TelescopePromptBorder = "#171723",
  TelescopePromptTitle = "#171723",
  NeoTreeNormal = "#171723",
  NeoTreeNormalNC = "#171723",
  NeoTreeVertSplit = "#1e1e2e",
  NeoTreeWinSeparator = "#1e1e2e",
  NeoTreeEndOfBuffer = "#171723",
  NvimTreeNormal = "#171723",
  NvimTreeVertSplit = "#1e1e2e",
  NvimTreeEndOfBuffer = "#171723",
  CursorLine = "#353543",
  CursorLineNr = "#353543",
}

for name, background in pairs(backgrounds) do
  local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    highlight.bg = background
    vim.api.nvim_set_hl(0, name, highlight)
  end
end
