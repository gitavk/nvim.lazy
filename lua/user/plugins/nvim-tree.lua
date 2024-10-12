return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies="nvim-tree/nvim-web-devicons",
    opts = {
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      view = {
        width = 30,
        side = "left",
      },
    },
  }
}
