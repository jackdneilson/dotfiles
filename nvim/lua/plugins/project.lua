return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/dotfiles/nvim/",
      "~/src/DMS/*",
      "~/src/DDCS/",
      "~/src/OCP/*",
      "~/src/iBIS/*",
      "~/src/odin-project"
    },
    picker = {
      type = "telescope",
    },
    last_session_on_startup = false,
  },
  init = function()
    vim.opt.sessionoptions:append("globals")
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  lazy = false,
  priority = 100,
  keys = {
    { "<leader>fp", "<cmd>NeovimProjectDiscover<CR>", desc = "Open project finder" },
    { "<leader>fh", "<cmd>NeovimProjectHistory<CR>",  desc = "Open project history" },
  }
}
