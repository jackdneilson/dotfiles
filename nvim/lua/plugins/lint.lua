return {
  {
    "mfussenegger/nvim-lint",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "biomejs" }
      }

      local trylint = function()
        require("lint").try_lint()
      end

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = trylint
      })

      vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        pattern = { "*.js" },
        callback = trylint
      })
    end
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = { "mfussenegger/nvim-lint" },
    config = function()
      require("mason-nvim-lint").setup({
        ensure_installed = { "biome" },
        ignore_install = { "biomejs" },
        automatic_installation = true
      })
    end
  }
}
