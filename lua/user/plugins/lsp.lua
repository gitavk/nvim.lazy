return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap.set -- for conciseness
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }
        -- set keybinds
        keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
        keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
        keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
        keymap("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename
        keymap("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
        keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
        keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
        keymap("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
        keymap("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
        keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
        keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
      end,
    })
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["pyright"] = function ()
        lspconfig["pyright"].setup({
          capabilities = capabilities,
          settings = {
            python = {
              pythonPath = "venv/bin/python3",
              analysis = {
                typeCheckingMode = "off",
              },
            },
          },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        })
      end,
    })
  end,
}
