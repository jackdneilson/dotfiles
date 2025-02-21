return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    ui = {
      confirm = {
        default_yes = true
      }
    },
    view = {
      relativenumber = true
    },
    filters = {
      dotfiles = true
    },
    renderer = {
      hidden_display = "simple"
    },
    diagnostics = {
      enable = true
    },
    modified = {
      enable = true
    }
  },
  keys = {
    { "<leader>fv", "<cmd>NvimTreeToggle<CR>", desc = "Toggle directory tree view" },
    { "<leader>fr", "<cmd>NvimTreeFocus<CR>",  desc = "Focus directory tree view" }
  }
}
