return {
  "coffebar/neovim-project",
  opts = {
    projects = {
      "~/AppData/Local/nvim",
      "~/doc",

      "~/Source/DMS/*",
      "~/Source/DDCS/*",
      "~/Source/OCP/*",
      "~/Source/iBIS/*",
      "~/Source/Helicom/Helicom",
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
