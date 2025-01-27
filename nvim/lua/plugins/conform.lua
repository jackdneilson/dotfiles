return {
  'stevearc/conform.nvim',
  dependencies = { "neovim/nvim-lspconfig" },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<C-f>",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer"
    }
  },
  opts = {
    default_format_opts = {
      lsp_format = "fallback"
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500
    }
  }
}
