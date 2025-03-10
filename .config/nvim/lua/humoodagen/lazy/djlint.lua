return {
  {
    "stevearc/conform.nvim",
    -- If you already had some config, add to it:
    config = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { "*.html" },
        callback = function()
          vim.bo.filetype = "htmldjango"
        end,
      })

      require("conform").setup({
        formatters_by_ft = {
          htmldjango = { "djlint" },
        },
        formatters = {
          djlint = {
            command = "djlint",
            args = { "--reformat", "-" },
            stdin = true,
          },
        },
      })
    end
  }
}

