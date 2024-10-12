return {
  "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "folke/todo-comments.nvim",
    },
  config = function()

    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        prompt_prefix = " ",
        selection_caret = " "
      },
    })

    telescope.load_extension("fzf")
  end,
}
