return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  config = function()
    local configs = require "nvim-treesitter.configs"
    configs.setup {
      ensure_installed = { "lua", "bash", "python" },
      highlight = {
        enable = true,       -- false will disable the whole extension
        disable = { "css" }, -- list of language that will be disabled
      },
      autopairs = {
        enable = true,
      },
      indent = { enable = true, disable = { "python", "css" } },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }
  end,
}
