-- Define a helper to adjust background highlights (optional)
local function ColorMyPencils()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,         -- Ensure the plugin loads immediately
    priority = 1000,      -- Load early to ensure proper colorscheme setup
    opts = {
      flavour = "latte",         -- Use the "latte" flavour
      background = {
        light = "latte",         -- light background for light mode
        dark = "mocha",          -- dark background for dark mode (optional)
      },
      transparent_background = false, -- Set to false if you want a solid background
      term_colors = true,
      -- You can add further customization here if needed
    },
    config = function(_, opts)
      -- Set up the theme before applying the colorscheme
      require("catppuccin").setup(opts)
      -- Load the colorscheme explicitly
      vim.cmd("colorscheme catppuccin")
      -- Optionally adjust highlights after setting the colorscheme
      ColorMyPencils()
    end,
  },
}

