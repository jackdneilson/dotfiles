return {
  "maan2003/lsp_lines.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    vim.diagnostic.config({
      virtual_text = false
    })
    require("lsp_lines").setup()
  end
}
