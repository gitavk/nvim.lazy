return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        theme = "onedark",
        disabled_filetypes = { 
          "alpha",
          "NvimTree",
        },
      },
    })

  end,
}
