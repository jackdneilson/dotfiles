return {
  {
    'stevearc/conform.nvim',
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim"
    },
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
      },
      formatters_by_ft = {
        javascript = { "biome" }
      }
    }
  },
  {
    "zapling/mason-conform.nvim",
    dependencies = { "stevearc/conform.nvim" },
    config = function()
      require("mason-conform").setup()
    end
  }
}
