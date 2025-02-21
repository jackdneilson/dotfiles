return {
  {
    'nanozuki/tabby.nvim',
    lazy = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("tabby").setup()
    end,
    keys = {
      { "<leader>t",  "",                           desc = "+tabs" },
      { "<leader>tj", "<cmd>Tabby jump_to_tab<CR>", desc = "Jump to tab" },
      { "<leader>tn", ":tabn<CR>",                  desc = "Next tab" },
      { "<leader>tp", ":tabp<CR>",                  desc = "Prev tab" },
      { "<leader>ta", ":$tabnew<CR>",               desc = "Open new tab" },
      { "<leader>tc", ":tabclose<CR>",              desc = "Close tab" },
    }
  }
}
