return {
  "j-morano/buffer_manager.nvim",
  opts = {
    select_menu_item_commands = {
      v = {
        key = "<C-v>",
        command = "vsplit"
      },
      h = {
        key = "<C-h>",
        command = "split"
      }
    }
  },
  keys = {
    { "<leader>fb", function() require("buffer_manager.ui").toggle_quick_menu() end, desc = "Find buffers" }
  }
}
