return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function ()
    local toggleterm = require("toggleterm")
    toggleterm.setup {
      open_mapping = [[<c-\>]],
      direction = "float",
      shell = "/bin/bash",
      close_on_exit = true,
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.95)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.95)
        end,
      },
    }
    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    end
    vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
  end,
}
