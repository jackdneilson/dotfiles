return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_y = { { "location", padding = { left = 0, right = 1 } } },
      lualine_z = { { "lsp_status" } },
    },
  },
}
