return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('neoclip').setup()
  end,
  keys = {
    { "<leader>fc", "<cmd>Telescope neoclip<CR>", desc = "Find yanks" }
  }
}
