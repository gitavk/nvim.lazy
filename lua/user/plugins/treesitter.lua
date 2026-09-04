return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter").install({ "lua", "bash", "python", "markdown", "markdown_inline" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "bash", "python", "markdown" },
      callback = function()
        vim.treesitter.start()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
         vim.wo.foldlevel = 99
      end,
    })
  end,
}
