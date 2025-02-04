return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      mode = "n",
      desc = "Find files"
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      mode = "n",
      desc = "Live grep"
    },
  },
  config = function()
    require("telescope").load_extension("fzf")
  end
}
