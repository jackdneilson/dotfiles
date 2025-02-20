return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
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
      "<leader>fG",
      function()
        require("telescope.builtin").live_grep()
      end,
      mode = "n",
      desc = "Live grep in cwd"
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep({ search_dirs = { vim.fn.expand("%:p") } })
      end,
      mode = "n",
      desc = "Live grep in current file"
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      mode = "n",
      desc = "Find notifications"
    },
  },
  config = function()
    require("telescope").setup({
      hijack_netrw = true
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("notify")
  end
}
