return {
  --   {
  --     "mfussenegger/nvim-lint",
  --     dependencies = { "neovim/nvim-lspconfig" },
  --     config = function()
  --       require("lint").linters_by_ft = {
  --         javascript = { "eslint_d" }
  --       }
  --     end
  --   },
  --   {
  --     "rshkarin/mason-nvim-lint",
  --     config = function()
  --       require("mason-nvim-lint").setup({
  --         ensure_installed = { "eslint_d" }
  --       })
  --     end
  --   }
}
