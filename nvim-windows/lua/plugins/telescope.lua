return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release && cmake --install build --prefix build"
    },
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
    {
      "<leader>fq",
      function()
        require("telescope.builtin").quickfix()
      end,
      mode = "n",
      desc = "Find in quickfix list"
    },
  },

  config = function()
    require("telescope").setup()
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("notify")
  end
}
