return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
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
    {
      "<leader>fr",
      function()
        require("telescope").extensions.file_browser.file_browser()
      end,
      mode = "n",
      desc = "Browse files from nvim root"
    },
    {
      "<leader>fv",
      function()
        require("telescope").extensions.file_browser.file_browser({ path="%:p:h" })
      end,
      mode = "n",
      desc = "Browse files from current buffer"
    }
  },
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end
}
