return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
      priority = 1000,
      opts = {
        transparent = false,
        colors = {
        bg         = "#06040b",
        dark_bg    = "#100a19",
        darker_bg  = "#06040b",
        lighter_bg = "#1a1029",

        fg         = "#ded7e8",
        dark_fg    = "#a99db6",
        light_fg   = "#e7def0",
        bright_fg  = "#f1e8f7",
        muted      = "#342346",

        red        = "#e06ba8",
        yellow     = "#d9c979",
        orange     = "#cf75ad",
        green      = "#a99acb",
        cyan       = "#bd9eea",
        blue       = "#9563da",
        purple     = "#a746e8",
        brown      = "#88546f",

        bright_red    = "#e06ba8",
        bright_yellow = "#d9c979",
        bright_green  = "#a99acb",
        bright_cyan   = "#bd9eea",
        bright_blue   = "#9563da",
        bright_purple = "#a746e8",

        accent               = "#9563da",
        cursor               = "#ded7e8",
        foreground           = "#ded7e8",
        background           = "#06040b",
        selection             = "#1a1029",
        selection_foreground = "#ded7e8",
        selection_background = "#1a1029",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
