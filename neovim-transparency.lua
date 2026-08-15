-- Nous Research Purple keeps the original Aether palette opaque in Neovim.
-- This file is installed as plugin/after/transparency.lua because Omarchy's
-- theme hot-reloader sources that path after every colorscheme change.
local backgrounds = {
  Normal = "#06040b",
  NormalNC = "#06040b",
  EndOfBuffer = "#06040b",
  FoldColumn = "#06040b",
  SignColumn = "#06040b",
  LineNr = "#06040b",
  Terminal = "#06040b",
  NormalFloat = "#100a19",
  FloatBorder = "#100a19",
  Pmenu = "#100a19",
  PmenuSbar = "#1a1029",
  PmenuThumb = "#9563da",
  Folded = "#100a19",
  WhichKeyFloat = "#100a19",
  TelescopeBorder = "#100a19",
  TelescopeNormal = "#100a19",
  TelescopePromptBorder = "#100a19",
  TelescopePromptTitle = "#100a19",
  NeoTreeNormal = "#100a19",
  NeoTreeNormalNC = "#100a19",
  NeoTreeVertSplit = "#06040b",
  NeoTreeWinSeparator = "#06040b",
  NeoTreeEndOfBuffer = "#100a19",
  NvimTreeNormal = "#100a19",
  NvimTreeVertSplit = "#06040b",
  NvimTreeEndOfBuffer = "#100a19",
  CursorLine = "#1a1029",
  CursorLineNr = "#1a1029",
}

for name, background in pairs(backgrounds) do
  local ok, highlight = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    highlight.bg = background
    vim.api.nvim_set_hl(0, name, highlight)
  end
end
